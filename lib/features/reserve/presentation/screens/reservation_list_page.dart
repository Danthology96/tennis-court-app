import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  static const name = 'reservation-list';
  static const path = '/$name';

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Reservation?>? userReservations;
  late final String? userId;
  @override
  void initState() {
    super.initState();
    userId = context.read<AuthCubit>().state.user?.id;
    if (userId != null) {
      context
          .read<ReservationsListCubit>()
          .getUserReservations(userId: userId!)
          .then((value) {
        userReservations = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const spacer = SizedBox(height: 20);
    const halfSpacer = SizedBox(height: 10);
    final reservationsListCubit = context.watch<ReservationsListCubit>();
    userReservations = reservationsListCubit.state.userReservations;

    return Scaffold(
        key: scaffoldKey,
        appBar: const CustomAppBar(),
        endDrawer: SideMenu(scaffoldKey: scaffoldKey),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              halfSpacer,
              Padding(
                padding: appPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: colorScheme.surface),
                    onPressed: () {},
                    label: const Text("Programar reserva"),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: colorScheme.surface.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              halfSpacer,
              Padding(
                padding: appPaddingHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userReservations == null ||
                        userReservations?.isEmpty == true)
                      Text("No hay reservas programadas",
                          style: textTheme.titleMedium)
                    else ...[
                      Text("Mis reservas",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          )),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: userReservations?.length ?? 0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return ReservationCard(
                            reservation: userReservations![index]!,
                          );
                        },
                      ),
                    ]
                  ],
                ),
              ),
              spacer,
            ],
          ),
        ));
  }
}
