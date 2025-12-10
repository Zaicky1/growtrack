import 'package:flutter/material.dart';

abstract class CollapsibleDelegate {
  void onToggle(bool isExpanded);
}

class CollapsibleViewModel {
  final String title;
  final Widget content;
  final IconData? icon;
  final bool isExpanded;
  final bool isDisabled;
  final bool showBorder;
  CollapsibleDelegate? delegate;

  CollapsibleViewModel({
    required this.title,
    required this.content,
    this.delegate,
    this.icon,
    this.isExpanded = false,
    this.isDisabled = false,
    this.showBorder = true,
  });
}
