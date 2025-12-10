import 'package:flutter/material.dart';

abstract class CarouselDelegate {
  void onPageChanged(int pageIndex);
}

class CarouselViewModel {
  final List<Widget> items;
  final int initialIndex;
  final bool showIndicators;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final bool isInfinite;
  CarouselDelegate? delegate;

  CarouselViewModel({
    required this.items,
    this.delegate,
    this.initialIndex = 0,
    this.showIndicators = true,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.isInfinite = true,
  });
}
