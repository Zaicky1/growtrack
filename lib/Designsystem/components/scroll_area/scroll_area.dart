import 'package:flutter/material.dart';

class GTScrollArea extends StatelessWidget {
  final Widget child;

  const GTScrollArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: child);
  }
}
