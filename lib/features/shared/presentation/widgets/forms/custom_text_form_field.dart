import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.hintText,
    required this.name,
    this.validator,
    this.onChanged,
    this.onTap,
    this.obscureText,
    this.prefix,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffix,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.enabled,
    this.maxLines = 1,
  });
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? enabled;
  final String name;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;

  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return FormBuilderTextField(
      name: name,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      initialValue: initialValue,
      enabled: enabled ?? true,
      obscureText: obscureText ?? false,
      enableSuggestions: true,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        alignLabelWithHint: true,
        labelStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
      ),
    );
  }
}
