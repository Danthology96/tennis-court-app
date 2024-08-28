import 'package:flutter/material.dart';

class CourtAvailability extends StatelessWidget {
  const CourtAvailability({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Row(
      children: [
        Row(
          children: [
            Text(
              'Disponible',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: captionTheme,
            ),
            const SizedBox(width: 5),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: colorScheme.tertiary),
            )
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                size: 13,
              ),
              const SizedBox(width: 5),
              Text(
                '10:00 am a 12:00pm',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: captionTheme,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
