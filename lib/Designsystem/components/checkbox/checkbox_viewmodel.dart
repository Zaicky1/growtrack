import 'package:flutter/material.dart';

enum CheckboxSize { small, medium, large }

enum CheckboxState { unchecked, checked, indeterminate, disabled }

abstract class CheckboxDelegate {
  void onChanged(bool value);
}

class CheckboxViewModel {
  final CheckboxSize size;
  final CheckboxState state;
  final String? label;
  final String? description;
  final bool isRequired;
  final bool isReadOnly;
  CheckboxDelegate? delegate;

  CheckboxViewModel({
    required this.size,
    required this.state,
    this.delegate,
    this.label,
    this.description,
    this.isRequired = false,
    this.isReadOnly = false,
  });
}
