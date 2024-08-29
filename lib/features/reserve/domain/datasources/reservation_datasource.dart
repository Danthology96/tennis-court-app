import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Data origins for reservation feature
/// This datasource will use the local db (Isar)
abstract class ReservationDataSource {
  /// function that register a reservation in the database, it requires the reservation's info
  Future<bool?> registerReservation(
      {required Map<String, dynamic> reservation});

  /// function that gets the reservations of a user
  Future<List<Reservation?>?> getReservations();

  /// function that gets the user reservations
  Future<List<Reservation?>?> getUserReservations({required String userId});
}
