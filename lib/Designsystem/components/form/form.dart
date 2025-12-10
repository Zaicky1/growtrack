import 'package:flutter/material.dart';

class GTForm extends StatelessWidget {
  final Widget child;
  final GlobalKey<FormState>? formKey;

  const GTForm({Key? key, required this.child, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(key: formKey, child: child);
  }
}
