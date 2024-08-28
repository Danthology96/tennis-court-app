import 'package:tennis_court_app/features/reserve/reserve.dart';

class ReservationRepositoryImpl extends ReservationRepository {
  final ReservationDataSource? dataSource;

  ReservationRepositoryImpl({ReservationDataSource? dataSource})
      : dataSource = dataSource ?? ReservationDatasourceImpl();

  @override
  Future<List<Reservation?>?> getReservations() async {
    return await dataSource!.getReservations();
  }

  @override
  Future<List<Reservation?>?> getUserReservations(
      {required String userId}) async {
    return await dataSource!.getUserReservations(userId: userId);
  }

  @override
  Future<bool?> registerReservation(
      {required Map<String, dynamic> reservation}) async {
    return await dataSource!.registerReservation(reservation: reservation);
  }
}
