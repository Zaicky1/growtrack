import 'package:flutter/material.dart';

enum TableSortDirection { ascending, descending }

abstract class TableDelegate {
  void onRowTapped(int rowIndex);
  void onSortChanged(String columnName, TableSortDirection direction);
  void onPageChanged(int pageNumber);
}

class TableColumnViewModel {
  final String name;
  final String label;
  final bool isSortable;
  final double? width;
  final bool isVisible;

  TableColumnViewModel({
    required this.name,
    required this.label,
    this.isSortable = false,
    this.width,
    this.isVisible = true,
  });
}

class TableViewModel {
  final List<TableColumnViewModel> columns;
  final List<Map<String, dynamic>> rows;
  final bool isPaginated;
  final int rowsPerPage;
  final int currentPage;
  final bool isSelectable;
  final List<int>? selectedRows;
  TableDelegate? delegate;

  TableViewModel({
    required this.columns,
    required this.rows,
    this.delegate,
    this.isPaginated = false,
    this.rowsPerPage = 10,
    this.currentPage = 1,
    this.isSelectable = false,
    this.selectedRows,
  });
}
