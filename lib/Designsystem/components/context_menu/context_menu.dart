import 'package:flutter/material.dart';

class GTContextMenu extends StatelessWidget {
  final Widget child;
  final List<PopupMenuEntry> items;

  const GTContextMenu({Key? key, required this.child, required this.items})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (details) => showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          details.globalPosition.dx,
          details.globalPosition.dy,
          0,
          0,
        ),
        items: items,
      ),
      child: child,
    );
  }
}
