import 'package:flutter/material.dart';

abstract class DropdownMenuDelegate {
  void onItemSelected(String value);
  void onOpened();
  void onClosed();
}

class DropdownMenuItemViewModel {
  final String value;
  final String label;
  final IconData? icon;

  DropdownMenuItemViewModel({
    required this.value,
    required this.label,
    this.icon,
  });
}

class DropdownMenuViewModel {
  final List<DropdownMenuItemViewModel> items;
  final String? selectedValue;
  final String? label;
  DropdownMenuDelegate? delegate;

  DropdownMenuViewModel({
    required this.items,
    this.delegate,
    this.selectedValue,
    this.label,
  });
}
