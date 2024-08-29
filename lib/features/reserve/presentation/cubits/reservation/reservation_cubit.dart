import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final Court court;
  final User user;
  final WeatherRepository weatherRepository = OpenWeatherRepository();
  final ReservationRepository reservationRepository =
      ReservationRepositoryImpl();
  ReservationCubit({required this.court, required this.user})
      : super(const ReservationState()) {
    setCourtInfo(court);
  }

  Future<bool?> reserve() async {
    if (state.isReservationValid == false) {
      customToastAlerts(type: AlertType.error, message: 'Reserva no válida');
      return false;
    }

    final reservation = Reservation(
      courtId: state.courtId,
      startDate: state.startDate!,
      userId: user.id,
      endDate: state.endDate!,
      commentary: state.commentary,
      weather: state.currentWeather,
    );
    final result = await reservationRepository.registerReservation(
        reservation: reservation.toJson());

    return result;
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
