import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'reservations_list_state.dart';

class ReservationsListCubit extends Cubit<ReservationListState> {
  final ReservationRepository reservationRepository =
      ReservationRepositoryImpl();
  final CourtRepository courtRepository = CourtRepositoryImpl();
  ReservationsListCubit() : super(const ReservationListState()) {
    getAllReservations();
  }

  Future<List<Reservation?>?> getUserReservations(
      {required String userId}) async {
    final reservations = await reservationRepository.getUserReservations(
      userId: userId,
    );
    List<Reservation?> reservationsWithCourts = [];
    if (reservations != null) {
      for (var reservation in reservations) {
        final court = await getReservationCourt(courtId: reservation!.courtId!);
        reservationsWithCourts.add(reservation.copyWith(court: court));
      }
    }
    emit(state.copyWith(userReservations: reservationsWithCourts));
    return reservations;
  }

  Future<void> getAllReservations() async {
    final reservations = await reservationRepository.getReservations();
    emit(state.copyWith(allReservations: reservations));
  }

  Future<Court?> getReservationCourt({required String courtId}) async {
    final court = await courtRepository.getCourt(courtId: courtId);
    return court;
  }
}
