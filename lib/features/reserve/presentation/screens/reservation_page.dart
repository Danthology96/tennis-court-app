import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court_app/features/auth/presentation/providers/cubits/auth_cubit/auth_cubit.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key, required this.court});

  static const name = 'reservation';
  static const path = '/$name';

  final Court court;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationCubit(
          court: court,
          user: context.read<AuthCubit>().state.user!,
          reservationsListCubit: context.read<ReservationsListCubit>()),
      child: const _ReservationPageBody(),
    );
  }
}

class _ReservationPageBody extends StatefulWidget {
  const _ReservationPageBody();

  @override
  State<_ReservationPageBody> createState() => __ReservationPageBodyState();
}

class __ReservationPageBodyState extends State<_ReservationPageBody> {
  String? dropdownValue;
  DateTime? startHour;
  DateTime? endHour;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const spacer = SizedBox(height: 20);
    final size = MediaQuery.of(context).size;
    final reservationCubit = context.watch<ReservationCubit>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ReservationAppbar(images: reservationCubit.state.images),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reservationCubit.state.courtName ?? '',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${reservationCubit.state.pricePerHour ?? 0.0}',
                        style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Cancha tipo ${reservationCubit.state.courtType?.name}',
                          style: textTheme.bodySmall),
                      Text(
                        "Por hora",
                        style: textTheme.labelSmall
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  spacer,
                  Row(
                    children: [
                      Expanded(
                        child: CourtAvailability(
                          isAvailable: true,
                          availableStartDate: DateTime.now(),
                          availableEndDate: DateTime.now().add(const Duration(
                            hours: 5,
                          )),
                        ),
                      ),
                      ClimateWidget(
                        weather: reservationCubit.state.currentWeather,
                      ),
                    ],
                  ),
                  spacer,
                  if (reservationCubit.state.adress != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 5),
                        Text(reservationCubit.state.adress!,
                            style: textTheme.bodySmall),
                      ],
                    ),
                  spacer,
                  Row(
                    children: [
                      /// To set the dropdown un 3/5 of the screen
                      Expanded(
                        flex: 3,
                        child: CustomDropdownButton(
                          contentPadding: const EdgeInsets.all(6),
                          value: dropdownValue,
                          initialValue: 'Agregar instructor',
                          items: reservationCubit.state.courtInstructors
                              ?.map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                              reservationCubit.setInstructor(value as String);
                            });
                          },
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  spacer,
                ],
              ),
            ),
            Container(
              color: colorScheme.surfaceContainerHighest,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Establecer fecha y hora",
                      style: textTheme.titleMedium,
                    ),
                    spacer,
                    DateSelectorTile(
                      title: reservationCubit.state.startDate != null
                          ? DateFormat("dd/MM/yyyy")
                              .format(reservationCubit.state.startDate!)
                          : 'Seleccionar fecha',
                      onSelectionChanged: (value) {
                        reservationCubit.setStartDate(value.value as DateTime);
                      },
                      onCancel: () {
                        reservationCubit.setStartDate(DateTime.now());
                      },
                      onSubmit: (value) {
                        reservationCubit.setStartDate(value as DateTime);
                      },
                    ),
                    spacer,
                    Row(
                      children: [
                        Expanded(
                          child: HourSelector(
                            value: reservationCubit.state.startDate?.hour,
                            initialValue: 'Hora de inicio',
                            title: 'Hora de inicio',
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            items: List<DropdownMenuItem<int>>.generate(
                              24,
                              (int index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  enabled: index != 20 ? true : false,
                                  child: Text(
                                    '$index:00',
                                    style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        decoration: index == 0
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                );
                              },
                            ),
                            onChanged: (value) {
                              if (reservationCubit.state.startDate == null) {
                                reservationCubit.setStartDate(DateTime.now());
                              }
                              setState(() {
                                reservationCubit.setStartDate(reservationCubit
                                    .state.startDate!
                                    .copyWith(hour: value));
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: HourSelector(
                            initialValue: 'Hora de fin',
                            title: 'Hora de fin',
                            value: reservationCubit.state.endDate?.hour,
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            items: generateEndHours(
                                reservationCubit, textTheme, colorScheme),
                            onChanged: (value) {
                              DateTime? endDate =
                                  reservationCubit.state.startDate;
                              if (reservationCubit.state.startDate == null) {
                                reservationCubit.setStartDate(DateTime.now());
                              }
                              if (reservationCubit.state.startDate!.hour >
                                  value) {
                                reservationCubit.setEndDate(
                                    reservationCubit.state.startDate!.copyWith(
                                        hour: reservationCubit
                                                .state.startDate!.hour +
                                            1));
                                return;
                              }
                              setState(() {
                                endDate = reservationCubit.state.startDate;
                                reservationCubit
                                    .setEndDate(endDate!.copyWith(hour: value));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    spacer,
                    Text(
                      "Agregar un comentario",
                      style: textTheme.titleMedium,
                    ),
                    spacer,
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Escribe un comentario',
                        hintStyle: textTheme.bodyMedium,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: colorScheme.surface,
                      ),
                      onChanged: (value) {
                        reservationCubit.setCommentary(value);
                      },
                    ),
                    spacer,
                    spacer,
                    CustomFilledButton(
                      onPressed:
                          reservationCubit.state.isReservationValid == true
                              ? () async {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: colorScheme.surface,
                                    shape: const ContinuousRectangleBorder(),
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        child: ReservationDetails(
                                          reservationCubit: reservationCubit,
                                        ),
                                      );
                                    },
                                  );
                                }
                              : null,
                      text: 'Reservar',
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> generateEndHours(
      ReservationCubit reservationCubit,
      TextTheme textTheme,
      ColorScheme colorScheme) {
    List<DropdownMenuItem<int>> list = <DropdownMenuItem<int>>[];
    for (var i = (reservationCubit.state.startDate?.hour ?? 0) + 1;
        i < 24;
        i++) {
      list.add(DropdownMenuItem<int>(
        value: i,
        enabled:
            i > (reservationCubit.state.startDate?.hour ?? 0) ? true : false,
        child: Text(
          '$i:00',
          style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              decoration: i <= (reservationCubit.state.startDate?.hour ?? 0)
                  ? TextDecoration.lineThrough
                  : null),
        ),
      ));
    }
    return list;
  }
}
