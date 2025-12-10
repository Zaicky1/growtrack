import 'package:flutter/material.dart';

class GTProgress extends StatelessWidget {
  final double value; // 0.0 - 1.0

  const GTProgress({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: value);
  }
}
