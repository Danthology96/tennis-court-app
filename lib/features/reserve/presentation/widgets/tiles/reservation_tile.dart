import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

class ReservationTile extends StatelessWidget {
  const ReservationTile({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    final hours =
        (reservation.endDate?.hour ?? 0) - (reservation.startDate?.hour ?? 0);
    final user = context.read<AuthCubit>().state.user;
    final price = (reservation.court?.pricePerHour ?? 0) * hours;
    return Container(
      decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
      padding: appPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: (reservation.court?.imagePaths?.first != null)
                ? Image.asset(
                    reservation.court?.imagePaths?.first ?? '',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservation.court?.name ?? '',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              CourtReserveDateWidget(date: reservation.startDate),
              ReservedByWidget(user: user),
              Row(
                children: [
                  IconRowDetail(
                    text: "$hours ${hours > 1 ? 'horas' : 'hora'}",
                    icon: Icons.schedule,
                  ),
                  Text(" | \$${price.toStringAsFixed(2)}", style: captionTheme),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
