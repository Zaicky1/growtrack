import 'package:flutter/material.dart';

class GTDrawer extends StatelessWidget {
  final Widget child;

  const GTDrawer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: child);
  }
}
