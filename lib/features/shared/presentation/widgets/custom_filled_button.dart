import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.text,
    this.color,
    this.textColor,
    this.onPressed,
  });
  final void Function()? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color ?? colorScheme.surfaceContainer,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text?.toUpperCase() ?? '',
        style: textTheme.titleMedium?.copyWith(
          color: textColor ?? colorScheme.surface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
