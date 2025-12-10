import 'package:flutter/material.dart';

class ScrollAreaViewModel {
  final Widget content;
  final Axis scrollDirection;
  final bool showScrollbar;

  ScrollAreaViewModel({
    required this.content,
    this.scrollDirection = Axis.vertical,
    this.showScrollbar = true,
  });
}
