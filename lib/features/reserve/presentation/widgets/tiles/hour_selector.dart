import 'package:flutter/material.dart';

class HourSelector extends StatelessWidget {
  const HourSelector({
    super.key,
    this.title,
    this.items,
    this.onChanged,
    this.initialValue,
    this.padding,
    this.value,
    this.contentPadding,
    this.enabled,
  });
  final String? title;
  final String? initialValue;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final dynamic value;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    );

    return DropdownButtonFormField(
      value: value,
      padding: padding,
      isExpanded: true,
      dropdownColor: colorScheme.surface,
      menuMaxHeight: 150,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: contentPadding,
        isDense: true,
        enabledBorder: border,
        border: border,
        focusColor: colorScheme.onSurface,
        label: title != null ? Text(title!) : null,
        labelStyle: textTheme.bodyMedium,
        fillColor: colorScheme.surface,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.transparent,
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
      style: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      icon:
          Icon(Icons.keyboard_arrow_down, color: colorScheme.onSurfaceVariant),
    );
  }
}
