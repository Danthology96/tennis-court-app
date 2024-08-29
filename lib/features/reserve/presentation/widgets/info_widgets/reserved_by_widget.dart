import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservedByWidget extends StatelessWidget {
  const ReservedByWidget({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Row(
      children: [
        Text(
          'Reservado por:',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: captionTheme,
        ),
        const SizedBox(width: 5),
        Row(
          children: [
            const ProfileCircleAvatar(
              radius: 10,
            ),
            const SizedBox(width: 5),
            Text(user?.names ?? 'Rafael Nadal', style: captionTheme),
          ],
        )
      ],
    );
  }
}
