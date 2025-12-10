import 'package:flutter/material.dart';

enum SwitchSize { small, medium, large }

enum SwitchState { off, on, disabled }

abstract class SwitchDelegate {
  void onChanged(bool value);
}

class SwitchViewModel {
  final SwitchSize size;
  final SwitchState state;
  final String? label;
  final String? description;
  final bool isReadOnly;
  SwitchDelegate? delegate;

  SwitchViewModel({
    required this.size,
    required this.state,
    this.delegate,
    this.label,
    this.description,
    this.isReadOnly = false,
  });
}
