import 'package:flutter/material.dart';

enum SkeletonShape {
  rectangle,
  circle,
  text,
}

class SkeletonViewModel {
  final SkeletonShape shape;
  final double? width;
  final double? height;
  final int? lineCount;
  final bool isAnimated;

  SkeletonViewModel({
    required this.shape,
    this.width,
    this.height,
    this.lineCount,
    this.isAnimated = true,
  });
}
