import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourtAvailability extends StatelessWidget {
  const CourtAvailability({
    super.key,
    required this.isAvailable,
    this.availableStartDate,
    this.availableEndDate,
  });

  final bool isAvailable;
  final DateTime? availableStartDate;
  final DateTime? availableEndDate;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    final availableDateString = _getAvailability();

    return Row(
      children: [
        Row(
          children: [
            Text(
              isAvailable ? 'Disponible' : 'No disponible',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: captionTheme,
            ),
            const SizedBox(width: 5),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isAvailable ? colorScheme.tertiary : colorScheme.error),
            )
          ],
        ),
        const SizedBox(width: 10),
        if (isAvailable)
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  size: 13,
                ),
                const SizedBox(width: 5),
                Text(
                  availableDateString ?? 'No disponible',
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

  String? _getAvailability() {
    final availableStartDateString = availableStartDate != null
        ? DateFormat("HH:mm").format(availableStartDate!)
        : null;
    final availableEndDateString = availableEndDate != null
        ? DateFormat("HH:mm").format(availableEndDate!)
        : null;
    return availableStartDateString != null
        ? '$availableStartDateString a $availableEndDateString'
        : null;
  }
}
