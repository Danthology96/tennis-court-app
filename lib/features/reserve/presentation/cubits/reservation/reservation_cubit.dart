import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final Court court;
  final WeatherRepository weatherRepository = OpenWeatherRepository();
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
      currentWeather: court.weather,
    ));
  }

  void setInstructor(String instructor) {
    emit(state.copyWith(instructor: instructor));
    checkIsReservationValid();
  }

  void setStartDate(DateTime startDate) {
    emit(state.copyWith(
      startDate: startDate,
    ));
    setEndDate(startDate.add(const Duration(hours: 1)));
    checkIsReservationValid();
  }

  Future<void> setEndDate(DateTime endDate) async {
    emit(state.copyWith(endDate: endDate));
    await getWeather();
    checkIsReservationValid();
  }

  void setCommentary(String commentary) {
    emit(state.copyWith(commentary: commentary));
    checkIsReservationValid();
  }

  void clearReservation() {
    emit(const ReservationState());
  }

  void setWeather(Weather weather) {
    emit(state.copyWith(currentWeather: weather));
  }

  void checkIsReservationValid() {
    final isReservationValid = state.instructor != null &&
        state.startDate != null &&
        state.endDate != null;
    emit(state.copyWith(isReservationValid: isReservationValid));
  }

  Future<void> getWeather() async {
    if (state.latLngLocation == null) return;
    if (state.startDate == null) return;

    final weather = await weatherRepository.getTimestampWeather(
      lat: state.latLngLocation!.latitude!,
      lng: state.latLngLocation!.longitude!,
      timestamp: state.startDate!,
    );
    if (weather != null) {
      setWeather(weather);
    }
  }
}
