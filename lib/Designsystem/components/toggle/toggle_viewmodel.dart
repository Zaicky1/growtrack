import 'package:flutter/material.dart';

enum ToggleSize { small, medium, large }

enum ToggleState { inactive, active, disabled }

abstract class ToggleDelegate {
  void onToggled(bool isActive);
}

class ToggleViewModel {
  final ToggleSize size;
  final ToggleState state;
  final String? label;
  final bool isPressed;
  final IconData? icon;
  ToggleDelegate? delegate;

  ToggleViewModel({
    required this.size,
    required this.state,
    this.delegate,
    this.label,
    this.isPressed = false,
    this.icon,
  });
}
