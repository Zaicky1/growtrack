import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

enum ButtonVariant { primary, secondary, destructive, outline, ghost, link }

abstract class ButtonDelegate {
  void onPressed();
}

class ButtonViewModel {
  final ButtonSize size;
  final ButtonVariant variant;
  final String label;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final bool fullWidth;
  ButtonDelegate? delegate;

  ButtonViewModel({
    required this.size,
    required this.variant,
    required this.label,
    this.delegate,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  });
}
