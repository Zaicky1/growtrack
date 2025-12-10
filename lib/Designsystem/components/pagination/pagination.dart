import 'package:flutter/material.dart';

class GTPagination extends StatelessWidget {
  final int page;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;

  const GTPagination({
    Key? key,
    required this.page,
    required this.totalPages,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: page > 1 ? () => onPageChanged?.call(page - 1) : null,
        ),
        Text('$page / $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: page < totalPages
              ? () => onPageChanged?.call(page + 1)
              : null,
        ),
      ],
    );
  }
}
