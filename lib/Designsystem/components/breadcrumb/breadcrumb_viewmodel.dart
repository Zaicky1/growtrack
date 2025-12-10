import 'package:flutter/material.dart';

abstract class BreadcrumbDelegate {
  void onBreadcrumbTapped(int index);
}

class BreadcrumbItemViewModel {
  final String label;
  final String? route;
  final IconData? icon;

  BreadcrumbItemViewModel({required this.label, this.route, this.icon});
}

class BreadcrumbViewModel {
  final List<BreadcrumbItemViewModel> items;
  final String separator;
  final bool isCollapsible;
  BreadcrumbDelegate? delegate;

  BreadcrumbViewModel({
    required this.items,
    this.delegate,
    this.separator = '/',
    this.isCollapsible = false,
  });
}
