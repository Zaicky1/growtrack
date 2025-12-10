import 'package:flutter/material.dart';

abstract class ContextMenuDelegate {
  void onItemSelected(String value);
}

class ContextMenuItemViewModel {
  final String value;
  final String label;
  final IconData? icon;
  final bool isDanger;

  ContextMenuItemViewModel({
    required this.value,
    required this.label,
    this.icon,
    this.isDanger = false,
  });
}

class ContextMenuViewModel {
  final List<ContextMenuItemViewModel> items;
  ContextMenuDelegate? delegate;

  ContextMenuViewModel({
    required this.items,
    this.delegate,
  });
}
