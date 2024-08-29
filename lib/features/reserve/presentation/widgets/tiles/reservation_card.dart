import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key, required this.reservation});

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 5);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final user = context.read<AuthCubit>().state.user;

    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    final hours =
        (reservation.endDate?.hour ?? 0) - (reservation.startDate?.hour ?? 0);
    final price = (reservation.court?.pricePerHour ?? 0) * hours;
    return Card(
      color: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      reservation.court?.imagePaths?[0] ??
                          'assets/images/no-image.png',
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.court?.name ?? 'Cancha de tenis',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    spacer,
                    Text("Cancha tipo ${reservation.court?.courtType.name}",
                        style: captionTheme),
                    spacer,
                    CourtReserveDateWidget(date: reservation.startDate),
                    spacer,
                    ReservedByWidget(
                      user: user,
                    ),
                    spacer,
                    Row(
                      children: [
                        IconRowDetail(
                          text: "$hours ${hours > 1 ? 'horas' : 'hora'}",
                          icon: Icons.schedule,
                        ),
                        Text(" | \$${price.toStringAsFixed(2)}",
                            style: captionTheme),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    width: 60,
                    height: 60,
                    child: ClimateWidget(weather: reservation.court?.weather)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
