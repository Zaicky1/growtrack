import 'package:flutter/material.dart';

enum LabelSize {
  small,
  medium,
  large,
}

enum LabelVariant {
  default_,
  success,
  warning,
  error,
  info,
}

class LabelViewModel {
  final LabelSize size;
  final LabelVariant variant;
  final String text;
  final IconData? icon;
  final bool isRequired;

  LabelViewModel({
    required this.size,
    required this.variant,
    required this.text,
    this.icon,
    this.isRequired = false,
  });
}
