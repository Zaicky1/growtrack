import 'package:flutter/material.dart';

class GTSeparator extends StatelessWidget {
  final Axis axis;

  const GTSeparator({Key? key, this.axis = Axis.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal ? const Divider() : const VerticalDivider();
  }
}
