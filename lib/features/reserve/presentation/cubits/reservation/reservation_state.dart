part of 'reservation_cubit.dart';

class ReservationState extends Equatable {
  final Reservation? reservation;
  final String? courtId;
  final String? courtName;
  final CourtType? courtType;
  final double? pricePerHour;
  final Weather? weather;
  final String? adress;
  final LatLng? latLngLocation;
  final String? instructor;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? commentary;
  final List<String>? images;
  final List<String>? courtInstructors;

  /// to check if the reservation is valid
  final bool? isReservationValid;

  const ReservationState({
    this.reservation,
    this.courtId,
    this.courtName,
    this.courtType,
    this.pricePerHour,
    this.weather,
    this.adress,
    this.latLngLocation,
    this.instructor,
    this.startDate,
    this.endDate,
    this.commentary,
    this.images,
    this.courtInstructors,
    this.isReservationValid,
  });

  ReservationState copyWith({
    Reservation? reservation,
    String? courtId,
    String? courtName,
    CourtType? courtType,
    double? pricePerHour,
    Weather? weather,
    String? adress,
    LatLng? latLngLocation,
    String? instructor,
    List<String>? images,
    DateTime? startDate,
    DateTime? endDate,
    String? commentary,
    List<String>? courtInstructors,
    bool? isReservationValid = false,
  }) =>
      ReservationState(
        reservation: reservation ?? this.reservation,
        courtId: courtId ?? this.courtId,
        courtName: courtName ?? this.courtName,
        courtType: courtType ?? this.courtType,
        pricePerHour: pricePerHour ?? this.pricePerHour,
        weather: weather ?? this.weather,
        adress: adress ?? this.adress,
        latLngLocation: latLngLocation ?? this.latLngLocation,
        instructor: instructor ?? this.instructor,
        images: images ?? this.images,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        commentary: commentary ?? this.commentary,
        courtInstructors: courtInstructors ?? this.courtInstructors,
        isReservationValid: isReservationValid ?? this.isReservationValid,
      );

  @override
  List<Object?> get props => [
        reservation,
        courtId,
        courtName,
        courtType,
        pricePerHour,
        weather,
        adress,
        latLngLocation,
        instructor,
        images,
        startDate,
        endDate,
        commentary,
        courtInstructors,
        isReservationValid,
      ];
}
