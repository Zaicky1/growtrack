import 'package:flutter/material.dart';

class GTTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const GTTooltip({Key? key, required this.message, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: message, child: child);
  }
}
