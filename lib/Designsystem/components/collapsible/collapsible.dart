import 'package:flutter/material.dart';

class GTCollapsible extends StatelessWidget {
  final String title;
  final Widget child;

  const GTCollapsible({Key? key, required this.title, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: Text(title), children: [child]);
  }
}
