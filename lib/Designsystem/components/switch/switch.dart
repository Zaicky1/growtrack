import 'package:flutter/material.dart';

class GTSwitch extends StatelessWidget {
  final Widget? child;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const GTSwitch({Key? key, this.child, this.value = false, this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child!;
    }

    return Switch(value: value, onChanged: onChanged ?? (_) {});
  }
}
