import 'package:flutter/material.dart';

enum SheetPosition {
  bottom,
  left,
  right,
  top,
}

abstract class SheetDelegate {
  void onClose();
}

class SheetViewModel {
  final SheetPosition position;
  final Widget content;
  final String? title;
  final bool isDismissible;
  final bool showCloseButton;
  SheetDelegate? delegate;

  SheetViewModel({
    required this.position,
    required this.content,
    this.delegate,
    this.title,
    this.isDismissible = true,
    this.showCloseButton = true,
  });
}
