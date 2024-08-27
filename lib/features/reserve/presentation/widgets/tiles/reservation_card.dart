import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 10);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Card(
      color: colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Image
          SizedBox(
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/tennis-court-1.jpg',
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),
          spacer,

          /// content
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Cancha de tenis',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ClimateWidget(),
                  ],
                ),
                Text('Cancha tipo A', style: captionTheme),
                spacer,
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '9 de julio 2024',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: captionTheme,
                    ),
                  ],
                ),
                spacer,
                const CourtAvailability(),
                spacer,
                spacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomFilledButton(
                    onPressed: () {
                      context.pushNamed(ReservationPage.name);
                    },
                    height: 32,
                    text: 'Reservar',
                    textStyle: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
