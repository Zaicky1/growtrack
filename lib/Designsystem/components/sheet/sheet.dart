import 'package:flutter/material.dart';

class GTSheet {
  static Future<T?> showBottom<T>(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(context: context, builder: (_) => child);
  }
}
