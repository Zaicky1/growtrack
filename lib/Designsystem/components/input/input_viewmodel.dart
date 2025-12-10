import 'package:flutter/material.dart';

enum InputSize { small, medium, large }

enum InputType { text, email, password, number, phone, search }

enum InputState { normal, focused, error, disabled }

abstract class InputDelegate {
  void onChanged(String value);
  void onSubmitted(String value);
  void onFocusChanged(bool hasFocus);
}

class InputViewModel {
  final InputSize size;
  final InputType type;
  final InputState state;
  final String? placeholder;
  final String? label;
  final String? errorMessage;
  final bool isRequired;
  final int? maxLength;
  final int? minLength;
  final TextInputAction textInputAction;
  InputDelegate? delegate;

  InputViewModel({
    required this.size,
    required this.type,
    required this.state,
    this.delegate,
    this.placeholder,
    this.label,
    this.errorMessage,
    this.isRequired = false,
    this.maxLength,
    this.minLength,
    this.textInputAction = TextInputAction.done,
  });
}
