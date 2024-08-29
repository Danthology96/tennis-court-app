import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class CourtCard extends StatelessWidget {
  const CourtCard(
      {super.key, required this.court, this.width, this.imageHeight});

  final Court court;
  final double? width;
  final double? imageHeight;

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
            width: width ?? 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                court.imagePaths?[0] ?? 'assets/images/no-image.png',
                height: imageHeight ?? 130,
                fit: BoxFit.fill,
              ),
            ),
          ),
          spacer,

          /// content
          Container(
            width: width ?? 250,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        court.name ?? 'Cancha de tenis',
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
                Text("Cancha tipo ${court.courtType.name}",
                    style: captionTheme),
                spacer,
                const CourtReserveDateWidget(),
                spacer,
                CourtAvailability(
                  isAvailable: true,
                  availableStartDate: DateTime.now(),
                  availableEndDate: DateTime.now().copyWith(hour: 22),
                ),
                spacer,
                spacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomFilledButton(
                    onPressed: () {
                      context.pushNamed(ReservationPage.name, extra: court);
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
