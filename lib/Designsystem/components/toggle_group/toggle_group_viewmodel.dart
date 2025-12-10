import 'package:flutter/material.dart';

enum ToggleGroupSize {
  small,
  medium,
  large,
}

abstract class ToggleGroupDelegate {
  void onChanged(String selectedValue);
}

class ToggleGroupItemViewModel {
  final String value;
  final String label;
  final IconData? icon;

  ToggleGroupItemViewModel({
    required this.value,
    required this.label,
    this.icon,
  });
}

class ToggleGroupViewModel {
  final ToggleGroupSize size;
  final List<ToggleGroupItemViewModel> items;
  final String? selectedValue;
  final bool isMultiple;
  ToggleGroupDelegate? delegate;

  ToggleGroupViewModel({
    required this.size,
    required this.items,
    this.delegate,
    this.selectedValue,
    this.isMultiple = false,
  });
}
