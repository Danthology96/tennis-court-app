import 'dart:math';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tennis_court_app/config/config.dart';
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
        [ReservationSchema],
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

    return await reservations.getAll([]);
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
}
