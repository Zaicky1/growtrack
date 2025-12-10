import 'package:flutter/material.dart';

enum AccordionType { single, multiple }

abstract class AccordionDelegate {
  void onExpanded(int index);
  void onCollapsed(int index);
}

class AccordionItemViewModel {
  final String title;
  final Widget content;
  final IconData? icon;
  final bool isExpanded;
  final bool isDisabled;

  AccordionItemViewModel({
    required this.title,
    required this.content,
    this.icon,
    this.isExpanded = false,
    this.isDisabled = false,
  });
}

class AccordionViewModel {
  final AccordionType type;
  final List<AccordionItemViewModel> items;
  final bool showBorder;
  final bool allowMultiple;
  AccordionDelegate? delegate;

  AccordionViewModel({
    required this.type,
    required this.items,
    this.delegate,
    this.showBorder = true,
    this.allowMultiple = false,
  });
}
