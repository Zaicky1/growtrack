import 'package:flutter/material.dart';

enum DialogSize { small, medium, large, fullscreen }

enum DialogType { information, warning, error, success, confirmation }

abstract class DialogDelegate {
  void onConfirm();
  void onCancel();
  void onClose();
}

class DialogViewModel {
  final DialogSize size;
  final DialogType type;
  final String title;
  final String message;
  final List<String>? actionLabels;
  final bool isDismissible;
  final bool showCloseButton;
  final String? confirmButtonLabel;
  final String? cancelButtonLabel;
  DialogDelegate? delegate;

  DialogViewModel({
    required this.size,
    required this.type,
    required this.title,
    required this.message,
    this.delegate,
    this.actionLabels,
    this.isDismissible = true,
    this.showCloseButton = true,
    this.confirmButtonLabel = 'Confirm',
    this.cancelButtonLabel = 'Cancel',
  });
}
