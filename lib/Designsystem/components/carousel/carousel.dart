import 'package:flutter/material.dart';

class GTCarousel extends StatelessWidget {
  final List<Widget> items;

  const GTCarousel({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200, child: PageView(children: items));
  }
}
