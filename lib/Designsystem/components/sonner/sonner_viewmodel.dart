import 'package:flutter/material.dart';

enum SonnerType {
  success,
  error,
  info,
  warning,
  loading,
}

abstract class SonnerDelegate {
  void onClose();
  void onAction();
}

class SonnerViewModel {
  final SonnerType type;
  final String message;
  final Duration duration;
  final String? actionLabel;
  final bool showCloseButton;
  SonnerDelegate? delegate;

  SonnerViewModel({
    required this.type,
    required this.message,
    this.delegate,
    this.duration = const Duration(seconds: 3),
    this.actionLabel,
    this.showCloseButton = true,
  });
}
