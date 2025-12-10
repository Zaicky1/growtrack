import 'package:flutter/material.dart';

class GTAspectRatio extends StatelessWidget {
  final double ratio;
  final Widget child;

  const GTAspectRatio({Key? key, required this.ratio, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: ratio, child: child);
  }
}
