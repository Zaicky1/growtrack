import 'package:flutter/material.dart';

abstract class PaginationDelegate {
  void onPageChanged(int pageNumber);
  void onNextPage();
  void onPreviousPage();
}

class PaginationViewModel {
  final int totalItems;
  final int itemsPerPage;
  final int currentPage;
  final bool showFirstLastButtons;
  final bool showPageNumbers;
  final int maxVisiblePages;
  PaginationDelegate? delegate;

  int get totalPages => (totalItems / itemsPerPage).ceil();
  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;

  PaginationViewModel({
    required this.totalItems,
    required this.itemsPerPage,
    required this.currentPage,
    this.delegate,
    this.showFirstLastButtons = true,
    this.showPageNumbers = true,
    this.maxVisiblePages = 5,
  });
}
