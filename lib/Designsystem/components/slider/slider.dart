import 'package:flutter/material.dart';

class GTSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const GTSlider({Key? key, required this.value, this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(value: value, onChanged: onChanged ?? (_) {});
  }
}
