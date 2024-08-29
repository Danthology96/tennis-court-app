import 'dart:math';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

/// DataSource of the courts
class CourtDatasourceImpl extends CourtDataSource {
  late Future<Isar> db;

  CourtDatasourceImpl() {
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
  Future<List<Court?>?> getCourts() async {
    final isar = await db;
    final courts = isar.courts;

    return await courts.where().findAll();
  }

  @override
  Future<bool?> registerCourt({required Map<String, dynamic> court}) async {
    customToastAlerts(type: AlertType.loading);
    final isar = await db;
    final courts = isar.courts;

    /// checks if the court exists in the database (based on id)
    final courtExists =
        await courts.filter().idEqualTo(court['id']).findFirst();

    /// if the court exists, return false
    if (courtExists != null) {
      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Cancha no registrada');
      return false;
    } else {
      final random = Random();
      final id = random.nextInt(1000);

      /// method to add the court to the database
      await isar.writeTxn(() async {
        /// if the court does not exist, add the court to the database
        await courts.put(Court.fromMap(court).copyWith(id: id.toString()));
      });

      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Cancha registrada correctamente');
      return true;
    }
  }

  @override
  Future<bool?> registerAllCourts(List<Map<String, dynamic>> courts) async {
    final isar = await db;
    final currentCourts = isar.courts;

    /// method to add the courts to the database
    await isar.writeTxn(() async {
      await currentCourts.putAll(courts.map((e) => Court.fromMap(e)).toList());
    });
    return true;
  }

  @override
  Future<Court?> getCourt({required String courtId}) async {
    final isar = await db;
    final courts = isar.courts;

    return await courts.filter().idEqualTo(courtId).findFirst();
  }
}
