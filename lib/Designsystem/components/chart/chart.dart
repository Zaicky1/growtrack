import 'package:flutter/material.dart';

class GTChart extends StatelessWidget {
  final Widget? child;

  const GTChart({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: child ?? const Text('Chart placeholder'),
    );
  }
}
