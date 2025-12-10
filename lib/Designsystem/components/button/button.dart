import 'package:flutter/material.dart';

class GTButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const GTButton({Key? key, required this.child, this.onPressed, this.style})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, style: style, child: child);
  }
}
