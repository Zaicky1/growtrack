import 'package:flutter/material.dart';

class GTInput extends StatelessWidget {
  final Widget? child;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const GTInput({
    Key? key,
    this.child,
    this.controller,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child!;
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
