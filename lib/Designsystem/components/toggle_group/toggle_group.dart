import 'package:flutter/material.dart';

class GTToggleGroup extends StatelessWidget {
  final List<bool> values;
  final ValueChanged<int>? onToggle;

  const GTToggleGroup({Key? key, required this.values, this.onToggle})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(values.length, (i) {
        return ChoiceChip(
          label: Text((i + 1).toString()),
          selected: values[i],
          onSelected: (_) => onToggle?.call(i),
        );
      }),
    );
  }
}
