import 'package:flutter/material.dart';

class GTNavigationMenu extends StatelessWidget {
  final List<Widget> items;

  const GTNavigationMenu({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: items);
  }
}
