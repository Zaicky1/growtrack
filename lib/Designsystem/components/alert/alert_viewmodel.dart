import 'package:flutter/material.dart';

enum AlertType { success, error, warning, info }

enum AlertSize { small, medium, large }

abstract class AlertDelegate {
  void onClose();
  void onAction();
}

class AlertViewModel {
  final AlertType type;
  final AlertSize size;
  final String title;
  final String? message;
  final IconData? icon;
  final bool isDismissible;
  final String? actionLabel;
  AlertDelegate? delegate;

  AlertViewModel({
    required this.type,
    required this.size,
    required this.title,
    this.delegate,
    this.message,
    this.icon,
    this.isDismissible = true,
    this.actionLabel,
  });
}
