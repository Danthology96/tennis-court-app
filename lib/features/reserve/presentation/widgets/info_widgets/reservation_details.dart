import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({
    super.key,
    required this.reservationCubit,
  });

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    const spacer = SizedBox(height: 10);
    final hours = (reservationCubit.state.endDate?.hour ?? 0) -
        (reservationCubit.state.startDate?.hour ?? 0);
    return Flex(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Container(
            color: colorScheme.surfaceContainerHighest,
            width: size.width,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resumen',
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconRowDetail(
                      text:
                          'Cancha tipo ${reservationCubit.state.courtType?.name}',
                      icon: Icons.sports_tennis,
                    ),
                    if (reservationCubit.state.startDate != null)
                      IconRowDetail(
                        text: DateFormat('dd MMMM yyyy', 'es')
                            .format(reservationCubit.state.startDate!),
                        icon: Icons.calendar_today_outlined,
                      ),
                  ],
                ),
                spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconRowDetail(
                      text: 'Instructor ${reservationCubit.state.instructor}',
                      icon: Icons.person_outline,
                    ),
                    IconRowDetail(
                      text: "$hours ${hours > 1 ? 'horas' : 'hora'}",
                      icon: Icons.schedule,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total a pagar',
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${(reservationCubit.state.pricePerHour ?? 0) * hours}',
                          style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.tertiary,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('Por $hours ${hours > 1 ? 'horas' : 'hora'}',
                            style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomFilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Pagar',
                ),
                spacer,
                spacer,
                CustomOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Cancelar',
                ),
              ],
            ),
          ),
        ]);
  }
}

class IconRowDetail extends StatelessWidget {
  const IconRowDetail({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
