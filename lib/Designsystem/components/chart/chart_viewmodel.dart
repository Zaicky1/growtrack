import 'package:flutter/material.dart';

enum ChartType {
  line,
  bar,
  pie,
  area,
  scatter,
}

class ChartViewModel {
  final ChartType type;
  final List<dynamic> data;
  final String? title;
  final String? xAxisLabel;
  final String? yAxisLabel;
  final bool showLegend;
  final bool showGrid;

  ChartViewModel({
    required this.type,
    required this.data,
    this.title,
    this.xAxisLabel,
    this.yAxisLabel,
    this.showLegend = true,
    this.showGrid = true,
  });
}
