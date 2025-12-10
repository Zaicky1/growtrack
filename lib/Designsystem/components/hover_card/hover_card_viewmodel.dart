import 'package:flutter/material.dart';

class HoverCardViewModel {
  final Widget trigger;
  final Widget content;
  final Duration showDelay;
  final Duration hideDelay;

  HoverCardViewModel({
    required this.trigger,
    required this.content,
    this.showDelay = const Duration(milliseconds: 200),
    this.hideDelay = const Duration(milliseconds: 100),
  });
}
