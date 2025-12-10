import 'package:flutter/material.dart';

class GTCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GTCard({Key? key, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
