import 'package:flutter/material.dart';

class GTSidebar extends StatelessWidget {
  final Widget child;

  const GTSidebar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Theme.of(context).cardColor,
      child: child,
    );
  }
}
