import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Data origins for court feature
/// This datasource will use the local db (Isar)
abstract class CourtRepository {
  /// function that register a court in the database, it requires the court's info
  Future<bool?> registerCourt({required Map<String, dynamic> court});

  /// function that register all courts in the database, it requires the court's info
  Future<bool?> registerAllCourts(List<Map<String, dynamic>> courts);

  /// function that gets the courts of a user
  Future<List<Court?>?> getCourts();
}
