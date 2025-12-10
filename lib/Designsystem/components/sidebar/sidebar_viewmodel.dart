import 'package:flutter/material.dart';

abstract class SidebarDelegate {
  void onItemSelected(String itemId);
  void onToggle();
}

class SidebarItemViewModel {
  final String id;
  final String label;
  final IconData? icon;
  final bool isSelected;

  SidebarItemViewModel({
    required this.id,
    required this.label,
    this.icon,
    this.isSelected = false,
  });
}

class SidebarViewModel {
  final List<SidebarItemViewModel> items;
  final bool isCollapsed;
  final String? header;
  SidebarDelegate? delegate;

  SidebarViewModel({
    required this.items,
    this.delegate,
    this.isCollapsed = false,
    this.header,
  });
}
