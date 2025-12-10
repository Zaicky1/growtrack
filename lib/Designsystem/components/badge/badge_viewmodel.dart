import 'package:flutter/material.dart';

enum BadgeVariant { primary, secondary, success, warning, error, info }

enum BadgeSize { small, medium, large }

class BadgeViewModel {
  final BadgeVariant variant;
  final BadgeSize size;
  final String label;
  final IconData? icon;
  final bool isDismissible;

  BadgeViewModel({
    required this.variant,
    required this.size,
    required this.label,
    this.icon,
    this.isDismissible = false,
  });
}
