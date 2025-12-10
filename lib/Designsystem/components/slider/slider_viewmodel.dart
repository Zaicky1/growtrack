import 'package:flutter/material.dart';

enum SliderSize { small, medium, large }

enum SliderState { normal, disabled, error }

abstract class SliderDelegate {
  void onChanged(double value);
  void onChangeEnd(double value);
}

class SliderViewModel {
  final SliderSize size;
  final SliderState state;
  final double minValue;
  final double maxValue;
  final double currentValue;
  final String? label;
  final bool showLabel;
  final bool isRange;
  final int divisions;
  SliderDelegate? delegate;

  SliderViewModel({
    required this.size,
    required this.state,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    this.delegate,
    this.label,
    this.showLabel = true,
    this.isRange = false,
    this.divisions = 1,
  });
}
