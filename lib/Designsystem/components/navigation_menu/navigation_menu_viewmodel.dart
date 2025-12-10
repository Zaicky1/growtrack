import 'package:flutter/material.dart';

abstract class NavigationMenuDelegate {
  void onItemSelected(String itemId);
}

class NavigationMenuItemViewModel {
  final String id;
  final String label;
  final IconData? icon;
  final String? badge;

  NavigationMenuItemViewModel({
    required this.id,
    required this.label,
    this.icon,
    this.badge,
  });
}

class NavigationMenuViewModel {
  final List<NavigationMenuItemViewModel> items;
  final String? selectedItemId;
  NavigationMenuDelegate? delegate;

  NavigationMenuViewModel({
    required this.items,
    this.delegate,
    this.selectedItemId,
  });
}
