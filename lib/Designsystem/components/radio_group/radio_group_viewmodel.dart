import 'package:flutter/material.dart';

enum RadioGroupSize { small, medium, large }

enum RadioGroupLayout { vertical, horizontal }

abstract class RadioGroupDelegate {
  void onChanged(String selectedValue);
}

class RadioOptionViewModel {
  final String value;
  final String label;
  final String? description;
  final bool isDisabled;

  RadioOptionViewModel({
    required this.value,
    required this.label,
    this.description,
    this.isDisabled = false,
  });
}

class RadioGroupViewModel {
  final RadioGroupSize size;
  final RadioGroupLayout layout;
  final List<RadioOptionViewModel> options;
  final String? selectedValue;
  final String? label;
  RadioGroupDelegate? delegate;

  RadioGroupViewModel({
    required this.size,
    required this.layout,
    required this.options,
    this.delegate,
    this.selectedValue,
    this.label,
  });
}
