import 'package:flutter/material.dart';

enum CardVariant { default_, elevated, outlined, filled }

enum CardSize { small, medium, large }

abstract class CardDelegate {
  void onPressed();
  void onLongPress();
}

class CardViewModel {
  final CardVariant variant;
  final CardSize size;
  final String? title;
  final String? subtitle;
  final String? description;
  final bool isClickable;
  final bool hasShadow;
  final EdgeInsets padding;
  final double? borderRadius;
  CardDelegate? delegate;

  CardViewModel({
    required this.variant,
    required this.size,
    this.delegate,
    this.title,
    this.subtitle,
    this.description,
    this.isClickable = false,
    this.hasShadow = true,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 8.0,
  });
}
