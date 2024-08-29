part of 'favorite_courts_cubit.dart';

class FavoriteCourtsState extends Equatable {
  const FavoriteCourtsState({this.favoriteCourts = const []});

  final List<Court?>? favoriteCourts;

  FavoriteCourtsState copyWith({List<Court?>? favoriteCourts}) {
    return FavoriteCourtsState(
        favoriteCourts: favoriteCourts ?? this.favoriteCourts);
  }

  @override
  List<Object?> get props => [favoriteCourts];
}
