// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

void main() {
  /// Test group for the reservation sort
  group('Reservation test', () {
    /// Setup for the test
    final List<Reservation> reservations = [
      Reservation(
        id: '1',
        courtId: '1',
        startDate: DateTime.now(),
        userId: '1',
        endDate: DateTime.now().add(const Duration(hours: 1)),
        commentary: 'Commentary',
      ),
      Reservation(
        id: '2',
        courtId: '1',
        startDate: DateTime.now().add(const Duration(days: 1)),
        userId: '1',
        endDate: DateTime.now().add(const Duration(days: 1, hours: 1)),
        commentary: 'Commentary',
      ),
      Reservation(
        id: '3',
        courtId: '1',
        startDate: DateTime.now().add(const Duration(days: 2)),
        userId: '1',
        endDate: DateTime.now().add(const Duration(days: 2, hours: 1)),
        commentary: 'Commentary',
      )
    ];
    test("Reservations should sort with the most recent first", () {
      final sortedReservations = [...reservations];
      sortedReservations.sort((a, b) => Comparable.compare(
          b.startDate as Comparable, a.startDate as Comparable));

      expect(sortedReservations.first.startDate, reservations[2].startDate);
    });
  });
}
