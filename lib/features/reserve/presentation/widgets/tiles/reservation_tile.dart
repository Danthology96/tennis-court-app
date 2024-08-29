import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

class ReservationTile extends StatelessWidget {
  const ReservationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Container(
      decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
      padding: appPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/tennis-court-1.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cancha de tenis',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
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
              const ReservedByWidget(),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    size: 13,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '2 horas',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: captionTheme,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "|",
                    style: captionTheme?.copyWith(
                        color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '\$50',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: captionTheme,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
