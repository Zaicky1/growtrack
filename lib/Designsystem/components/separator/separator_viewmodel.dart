import 'package:flutter/material.dart';

enum SeparatorOrientation {
  horizontal,
  vertical,
}

class SeparatorViewModel {
  final SeparatorOrientation orientation;
  final double? thickness;
  final Color? color;

  SeparatorViewModel({
    required this.orientation,
    this.thickness,
    this.color,
  });
}
