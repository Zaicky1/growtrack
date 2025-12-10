import 'package:flutter/material.dart';

abstract class MenubarDelegate {
  void onItemSelected(String itemId);
}

class MenubarItemViewModel {
  final String id;
  final String label;
  final IconData? icon;
  final List<MenubarItemViewModel>? submenu;

  MenubarItemViewModel({
    required this.id,
    required this.label,
    this.icon,
    this.submenu,
  });
}

class MenubarViewModel {
  final List<MenubarItemViewModel> items;
  MenubarDelegate? delegate;

  MenubarViewModel({
    required this.items,
    this.delegate,
  });
}
