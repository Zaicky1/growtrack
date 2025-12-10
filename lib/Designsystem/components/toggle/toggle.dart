import 'package:flutter/material.dart';

class GTToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const GTToggle({Key? key, required this.value, this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }
}
