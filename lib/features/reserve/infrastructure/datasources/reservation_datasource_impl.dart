import 'dart:math';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

/// DataSource of the reservation
class ReservationDatasourceImpl extends ReservationDataSource {
  late Future<Isar> db;

  ReservationDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema, CourtSchema, ReservationSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Reservation?>?> getReservations() async {
    final isar = await db;
    final reservations = isar.reservations;

    return await reservations.where().findAll();
  }

  @override
  Future<List<Reservation?>?> getUserReservations(
      {required String userId}) async {
    final isar = await db;
    final reservations = isar.reservations;

    return await reservations.filter().userIdEqualTo(userId).findAll();
  }

  @override
  Future<bool?> registerReservation(
      {required Map<String, dynamic> reservation}) async {
    customToastAlerts(type: AlertType.loading);
    final isar = await db;
    final reservations = isar.reservations;

    /// checks if the reservation exists in the database (based on id)
    final reservationExists =
        await reservations.filter().idEqualTo(reservation['id']).findFirst();

    final currentReservation = Reservation.fromJson(reservation);

    /// Checks if the court is available (a court is not available if there are 3 reservations on the same day)
    final reservationsList = await reservations
        .filter()
        .courtIdEqualTo(reservation['courtId'])
        .startDateBetween(
            currentReservation.startDate?.copyWith(hour: 0, minute: 0),
            currentReservation.endDate?.copyWith(hour: 23, minute: 59))
        .findAll();
    if (reservationsList.length >= 3) {
      await closeLoadingScreen().then((value) {
        customToastAlerts(
            type: AlertType.error,
            message: 'No se puede reservar la cancha para esta fecha');
      });

      return false;
    }

    /// if the reservation exists, return false
    if (reservationExists != null) {
      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Reservación no realizada');
      return false;
    } else {
      final random = Random();
      final id = random.nextInt(1000);

      /// method to add the reservation to the database
      await isar.writeTxn(() async {
        /// if the reservation does not exist, add the reservation to the database
        await reservations.put(Reservation.fromJson(reservation).copyWith(
          id: id.toString(),
        ));
      });

      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success,
          message: 'Reservación registrada correctamente');
      return true;
    }
  }

  @override
  Future<bool?> deleteReservation({required String reservationId}) async {
    customToastAlerts(type: AlertType.loading);
    final isar = await db;
    final reservations = isar.reservations;

    final reservationInDB =
        await reservations.filter().idEqualTo(reservationId).findFirst();
    if (reservationInDB == null) {
      customToastAlerts(
          type: AlertType.error,
          message: 'No se pudo encontrar la reservación');
      return false;
    }

    /// method to delete the reservation from the database
    final result = await isar.writeTxn(() async {
      return await reservations.delete(reservationInDB.isarId!);
    });

    /// to simulate a loading time
    await closeLoadingScreen();
    if (result) {
      customToastAlerts(
          type: AlertType.success,
          message: 'Reservación eliminada correctamente');
    } else {
      customToastAlerts(
          type: AlertType.error, message: 'No se pudo eliminar la reservación');
    }
    return result;
  }
}
