import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.text,
    this.color,
    this.textColor,
    this.onPressed,
    this.height,
    this.textStyle,
  });
  final void Function()? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color ?? colorScheme.surfaceContainer,
        minimumSize: Size(double.infinity, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text ?? '',
        style: textStyle ??
            textTheme.titleMedium?.copyWith(
              color: textColor ?? colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
