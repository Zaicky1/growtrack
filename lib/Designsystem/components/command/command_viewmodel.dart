import 'package:flutter/material.dart';

abstract class CommandDelegate {
  void onItemSelected(String value);
}

class CommandItemViewModel {
  final String value;
  final String label;
  final IconData? icon;
  final bool isDisabled;

  CommandItemViewModel({
    required this.value,
    required this.label,
    this.icon,
    this.isDisabled = false,
  });
}

class CommandViewModel {
  final List<CommandItemViewModel> items;
  final String? placeholder;
  final bool isSearchable;
  final bool showShortcuts;
  CommandDelegate? delegate;

  CommandViewModel({
    required this.items,
    this.delegate,
    this.placeholder,
    this.isSearchable = true,
    this.showShortcuts = false,
  });
}
