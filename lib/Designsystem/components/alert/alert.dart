import 'package:flutter/material.dart';

class GTAlert extends StatelessWidget {
  final String message;

  const GTAlert({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.yellow.shade700,
      child: Text(message),
    );
  }
}
