import 'package:flutter/material.dart';

class ResizableViewModel {
  final Widget content;
  final double initialWidth;
  final double initialHeight;
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final double? maxHeight;

  ResizableViewModel({
    required this.content,
    this.initialWidth = 300,
    this.initialHeight = 300,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
  });
}
