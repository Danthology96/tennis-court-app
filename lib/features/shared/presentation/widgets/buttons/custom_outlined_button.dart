import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, height ?? 50),
        side: BorderSide(color: color ?? colorScheme.onSurface),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text ?? '',
        style: textStyle ??
            textTheme.titleMedium?.copyWith(
              color: textColor ?? colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
