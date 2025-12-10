import 'package:flutter/material.dart';

class GTRadioGroup<T> extends StatelessWidget {
  final T? value;
  final ValueChanged<T?> onChanged;
  final List<Widget> children;

  const GTRadioGroup({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: children);
  }
}
