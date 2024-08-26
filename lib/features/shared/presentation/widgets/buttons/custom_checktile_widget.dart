import 'package:flutter/material.dart';

/// Since [CheckBoxListTile] has an awful padding that cannot be removed,
/// this widget was created.
/// - [horizontalGapPadding] : Sets the gap between the checkbox and the [text]
/// - [onChanged] : Is the function when the checkbox changes his state
class CustomCheckTileWidget extends StatelessWidget {
  const CustomCheckTileWidget({
    super.key,
    this.horizontalGapPadding,
    required this.value,
    this.text,
    this.onChanged,
  });
  final double? horizontalGapPadding;
  final bool value;
  final String? text;
  final Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          onChanged: onChanged,
          // Need this to act as an "offset" of the checkbox default min padding
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
        SizedBox(width: horizontalGapPadding ?? 10),
        Text(
          text ?? '',
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
