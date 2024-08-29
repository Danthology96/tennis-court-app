import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

class DateSelectorTile extends StatefulWidget {
  const DateSelectorTile({
    super.key,
    this.onSelectionChanged,
    this.onCancel,
    this.onSubmit,
    this.title,
  });

  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final void Function()? onCancel;
  final void Function(dynamic)? onSubmit;
  final String? title;

  @override
  State<DateSelectorTile> createState() => _DateSelectorTileState();
}

class _DateSelectorTileState extends State<DateSelectorTile> {
  bool _isExpanded = false;
  final expansionTileController = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: _isExpanded ? 8 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        controller: expansionTileController,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        collapsedBackgroundColor: colorScheme.surface,
        backgroundColor: colorScheme.surface,
        collapsedIconColor: colorScheme.onSurfaceVariant,
        iconColor: colorScheme.onSurfaceVariant,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(widget.title ?? 'seleccionar fecha'),
        children: [
          CalendarWidget(
            onSelectionChanged: widget.onSelectionChanged,
            onCancel: () {
              widget.onCancel?.call();
              expansionTileController.collapse();
            },
            onSubmit: (value) {
              widget.onSubmit?.call(value);
              expansionTileController.collapse();
            },
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
