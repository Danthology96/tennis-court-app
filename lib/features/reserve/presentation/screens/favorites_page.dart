import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const name = 'favorites';
  static const path = '/$name';

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Court?>? userFavorites;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final favoritesCubit = context.watch<FavoriteCourtsCubit>();
    userFavorites = favoritesCubit.state.favoriteCourts;

    return Scaffold(
        key: scaffoldKey,
        appBar: const CustomAppBar(),
        endDrawer: SideMenu(scaffoldKey: scaffoldKey),
        body: (userFavorites != null && userFavorites!.isNotEmpty == true)
            ? ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: CourtCard(
                      court: userFavorites![index]!,
                      width: double.infinity,
                      imageHeight: 200,
                    ),
                  );
                },
                itemCount: userFavorites!.length)
            : Center(
                child: Text(
                  "No tienes canchas favoritas",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ));
  }
}
