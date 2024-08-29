import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourtReserveDateWidget extends StatelessWidget {
  const CourtReserveDateWidget({
    super.key,
    this.date,
  });
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 13,
        ),
        const SizedBox(width: 5),
        Text(
          DateFormat("dd MMMM yyyy", "es").format(
            date ?? DateTime.now(),
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: captionTheme,
        ),
      ],
    );
  }
}
