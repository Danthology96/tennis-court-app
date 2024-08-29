import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const name = 'home';
  static const path = '/$name';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final authCubit = context.watch<AuthCubit>();
    final reservationsListCubit = context.watch<ReservationsListCubit>();
    final allReservations = reservationsListCubit.state.allReservations;
    const spacer = SizedBox(height: 20);
    const halfSpacer = SizedBox(height: 10);

    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: appPadding,
              child: Text("Hola ${authCubit.state.user?.names.split(' ')[0]}!",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Divider(color: colorScheme.surfaceContainerHighest),
            halfSpacer,
            Padding(
              padding: appPaddingHorizontal,
              child: Text("Canchas",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
            ),
            halfSpacer,
            const Padding(
              padding: appPadding,
              child: CourtsHorizontalListView(),
            ),
            spacer,
            Divider(color: colorScheme.surfaceContainerHighest),
            halfSpacer,
            Padding(
              padding: appPadding,
              child: Text("Reservas programadas",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
            ),
            halfSpacer,
            if (allReservations != null && allReservations.isNotEmpty)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allReservations.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return ReservationTile(
                    reservation: allReservations[index]!,
                  );
                },
              )
            else
              Padding(
                padding: appPaddingHorizontal,
                child: Text(
                  "No existen reservas programadas",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            spacer,
          ],
        ),
      ),
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
