import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      /// To change the color of the calendar, we need to change the colorScheme
      data: ThemeData(
        colorScheme: colorScheme.copyWith(primary: colorScheme.tertiary),
        textTheme: textTheme,
      ),
      child: SfDateRangePicker(
        /// header
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: colorScheme.surface,
          textAlign: TextAlign.center,
        ),

        cancelText: "Cancelar",
        confirmText: "Aplicar",
        showActionButtons: true,
        selectionShape: DateRangePickerSelectionShape.rectangle,
        showNavigationArrow: true,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.single,
        enablePastDates: false,
        backgroundColor: colorScheme.surface,
        selectionColor: colorScheme.tertiary,
        selectionTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.surface,
        ),

        monthCellStyle: DateRangePickerMonthCellStyle(
          disabledDatesDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledDatesTextStyle: TextStyle(
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          cellDecoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          todayCellDecoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          todayTextStyle:
              textTheme.bodySmall?.copyWith(color: colorScheme.tertiary),
          textStyle: textTheme.bodySmall,
          blackoutDatesDecoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(4),
          ),
          blackoutDateTextStyle: const TextStyle(
            color: Colors.red,
          ),
        ),

        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {},
        monthViewSettings: DateRangePickerMonthViewSettings(
          dayFormat: "E",
          viewHeaderHeight: 30,
          blackoutDates: [
            DateTime(2024, 09, 18),
            DateTime(2024, 09, 19),
            DateTime(2024, 08, 31),
          ],
        ),
      ),
    );
  }
}
