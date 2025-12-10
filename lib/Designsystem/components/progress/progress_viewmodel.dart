import 'package:flutter/material.dart';

enum ProgressSize { small, medium, large }

enum ProgressType { linear, circular }

class ProgressViewModel {
  final ProgressSize size;
  final ProgressType type;
  final double value;
  final double maxValue;
  final String? label;
  final bool showLabel;
  final Color? color;
  final Color? backgroundColor;

  double get percentage => (value / maxValue) * 100;

  ProgressViewModel({
    required this.size,
    required this.type,
    required this.value,
    this.maxValue = 100,
    this.label,
    this.showLabel = true,
    this.color,
    this.backgroundColor,
  });
}
