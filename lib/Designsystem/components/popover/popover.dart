import 'package:flutter/material.dart';

class GTPopover extends StatelessWidget {
  final Widget child;
  final Widget content;

  const GTPopover({Key? key, required this.child, required this.content})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (_) => [PopupMenuItem(child: content)],
      child: child,
    );
  }
}
