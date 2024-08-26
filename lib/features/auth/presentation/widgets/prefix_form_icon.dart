import 'package:flutter/material.dart';

class PrefixFormIcon extends StatelessWidget {
  const PrefixFormIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(right: 5),
      margin: const EdgeInsets.only(right: 5, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: colorScheme.onSurface)),
      ),
      child: Icon(
        icon,
        size: 20,
        color: colorScheme.onSurface,
      ),
    );
  }
}
