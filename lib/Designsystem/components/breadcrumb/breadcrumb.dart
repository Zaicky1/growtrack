import 'package:flutter/material.dart';

class GTBreadcrumb extends StatelessWidget {
  final List<Widget> items;

  const GTBreadcrumb({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length * 2 - 1, (i) {
        if (i.isEven) return items[i ~/ 2];
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.chevron_right, size: 16),
        );
      }),
    );
  }
}
