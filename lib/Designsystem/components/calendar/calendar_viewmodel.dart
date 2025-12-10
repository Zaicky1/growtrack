import 'package:flutter/material.dart';

abstract class CalendarDelegate {
  void onDateSelected(DateTime date);
  void onMonthChanged(DateTime newMonth);
}

class CalendarViewModel {
  final DateTime selectedDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final List<DateTime>? disabledDates;
  final bool isMultiSelect;
  CalendarDelegate? delegate;

  CalendarViewModel({
    required this.selectedDate,
    required this.firstDate,
    required this.lastDate,
    this.delegate,
    this.disabledDates,
    this.isMultiSelect = false,
  });
}
