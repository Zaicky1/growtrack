import 'package:flutter/material.dart';

abstract class DrawerDelegate {
  void onItemSelected(String itemId);
  void onClose();
}

class DrawerItemViewModel {
  final String id;
  final String label;
  final IconData? icon;
  final bool isSelected;

  DrawerItemViewModel({
    required this.id,
    required this.label,
    this.icon,
    this.isSelected = false,
  });
}

class DrawerViewModel {
  final String? header;
  final List<DrawerItemViewModel> items;
  final Widget? footer;
  final bool canClose;
  DrawerDelegate? delegate;

  DrawerViewModel({
    required this.items,
    this.delegate,
    this.header,
    this.footer,
    this.canClose = true,
  });
}
