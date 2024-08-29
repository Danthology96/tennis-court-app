import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'favorite_courts_state.dart';

class FavoriteCourtsCubit extends Cubit<FavoriteCourtsState> {
  final courtRepository = CourtRepositoryImpl();
  final SharedPreferences sharedPrefs;
  FavoriteCourtsCubit({required this.sharedPrefs})
      : super(const FavoriteCourtsState()) {
    if (sharedPrefs.getStringList('favoriteCourts') != null) {
      getFavoriteCourts(sharedPrefs.getStringList('favoriteCourts')!);
    }
  }

  void addFavoriteCourt(Court? court) {
    final List<Court?> favoriteCourts = List.from(state.favoriteCourts!);
    favoriteCourts.add(court);
    sharedPrefs.setStringList(
        'favoriteCourts', favoriteCourts.map((e) => e!.id!).toList());
    emit(state.copyWith(favoriteCourts: favoriteCourts));
  }

  void removeFavoriteCourt(Court? court) {
    final List<Court?> favoriteCourts = List.from(state.favoriteCourts!);
    favoriteCourts.remove(court);
    sharedPrefs.setStringList(
        'favoriteCourts', favoriteCourts.map((e) => e!.id!).toList());
    emit(state.copyWith(favoriteCourts: favoriteCourts));
  }

  void clearFavoriteCourts() {
    sharedPrefs.remove('favoriteCourts');
    emit(const FavoriteCourtsState());
  }

  Future<void> getFavoriteCourts(List<String> courtIds) async {
    final result = await courtRepository.getCourtsById(courtIds: courtIds);
    if (result != null) {
      emit(state.copyWith(favoriteCourts: result));
    }
  }
}
