import 'package:flutter/material.dart';

enum TabsOrientation { horizontal, vertical }

enum TabsSize { small, medium, large }

abstract class TabsDelegate {
  void onTabChanged(int index);
}

class TabViewModel {
  final String label;
  final Widget content;
  final IconData? icon;
  final bool isDisabled;

  TabViewModel({
    required this.label,
    required this.content,
    this.icon,
    this.isDisabled = false,
  });
}

class TabsViewModel {
  final TabsOrientation orientation;
  final TabsSize size;
  final List<TabViewModel> tabs;
  final int initialIndex;
  final bool isScrollable;
  TabsDelegate? delegate;

  TabsViewModel({
    required this.orientation,
    required this.size,
    required this.tabs,
    this.delegate,
    this.initialIndex = 0,
    this.isScrollable = false,
  });
}
