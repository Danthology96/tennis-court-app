import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final Court court;
  ReservationCubit({required this.court}) : super(const ReservationState()) {
    setCourtInfo(court);
  }

  void setReservation(Reservation reservation) {
    emit(state.copyWith(reservation: reservation));
  }

  void setCourtInfo(Court court) {
    emit(state.copyWith(
      courtId: court.id,
      courtName: court.name,
      courtType: court.courtType,
      pricePerHour: court.pricePerHour,
      adress: court.address,
      latLngLocation: court.latLngLocation,
      images: court.imagePaths,
      courtInstructors: court.instructors,
      weather: court.weather,
    ));
  }

  void setInstructor(String instructor) {
    emit(state.copyWith(instructor: instructor));
  }

  void setStartDate(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void setEndDate(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
  }

  void setCommentary(String commentary) {
    emit(state.copyWith(commentary: commentary));
  }

  void clearReservation() {
    emit(const ReservationState());
  }
}
