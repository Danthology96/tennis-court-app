part of 'reservations_list_cubit.dart';

class ReservationListState extends Equatable {
  final List<Reservation?>? allReservations;
  final List<Reservation?>? userReservations;

  const ReservationListState({
    this.allReservations,
    this.userReservations,
  });

  ReservationListState copyWith({
    List<Reservation?>? allReservations,
    List<Reservation?>? userReservations,
  }) {
    return ReservationListState(
      allReservations: allReservations ?? this.allReservations,
      userReservations: userReservations ?? this.userReservations,
    );
  }

  @override
  List<Object?> get props => [
        allReservations,
        userReservations,
      ];
}
