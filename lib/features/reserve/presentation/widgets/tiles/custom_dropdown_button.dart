import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.title,
    this.items,
    this.onChanged,
    this.initialValue,
    this.padding,
    this.value,
    this.contentPadding,
  });
  final String? title;
  final String? initialValue;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: colorScheme.onSurface,
      ),
    );

    return DropdownButtonFormField(
      value: value,
      padding: padding,
      isExpanded: true,
      dropdownColor: colorScheme.surface,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        isDense: true,
        enabledBorder: border,
        border: border,
        focusColor: colorScheme.onSurface,
        label: title != null ? Text(title!) : null,
        fillColor: colorScheme.surface,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: colorScheme.onSurface,
          ),
        ),
        filled: true,
      ),
      hint: initialValue != null
          ? Text(initialValue!,
              overflow: TextOverflow.ellipsis, style: textTheme.bodyLarge)
          : null,
      items: items,
      onChanged: onChanged,
      icon:
          Icon(Icons.keyboard_arrow_down, color: colorScheme.onSurfaceVariant),
    );
  }
}
