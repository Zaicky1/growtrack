import 'package:flutter/material.dart';

enum SelectSize { small, medium, large }

enum SelectState { normal, focused, error, disabled }

abstract class SelectDelegate {
  void onChanged(String selectedValue);
  void onOpened();
  void onClosed();
}

class SelectViewModel {
  final SelectSize size;
  final SelectState state;
  final String? placeholder;
  final String? label;
  final String? errorMessage;
  final List<String> options;
  final String? selectedValue;
  final bool isMultiple;
  final bool isSearchable;
  SelectDelegate? delegate;

  SelectViewModel({
    required this.size,
    required this.state,
    required this.options,
    this.delegate,
    this.placeholder,
    this.label,
    this.errorMessage,
    this.selectedValue,
    this.isMultiple = false,
    this.isSearchable = true,
  });
}
