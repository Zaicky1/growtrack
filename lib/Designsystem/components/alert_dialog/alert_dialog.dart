import 'package:flutter/material.dart';

class GTAlertDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
