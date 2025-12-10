import 'package:flutter/material.dart';

class GTDropdownMenu extends StatelessWidget {
  final Widget child;
  final List<PopupMenuEntry> items;

  const GTDropdownMenu({Key? key, required this.child, required this.items})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (_) => items, child: child);
  }
}
