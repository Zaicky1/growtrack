import 'package:flutter/material.dart';

class GTDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  const GTDialog({Key? key, this.title, this.content, this.actions})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: title, content: content, actions: actions);
  }

  static Future<T?> show<T>(BuildContext context, Widget child) {
    return showDialog<T>(
      context: context,
      builder: (_) => AlertDialog(content: child),
    );
  }
}
