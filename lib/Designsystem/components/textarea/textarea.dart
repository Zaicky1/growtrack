import 'package:flutter/material.dart';

class GTTextarea extends StatelessWidget {
  final Widget? child;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;

  const GTTextarea({
    Key? key,
    this.child,
    this.controller,
    this.hintText,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child!;
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 6,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
