import 'package:flutter/material.dart';

enum TextareaSize { small, medium, large }

enum TextareaState { normal, focused, error, disabled }

abstract class TextareaDelegate {
  void onChanged(String value);
  void onSubmitted(String value);
}

class TextareaViewModel {
  final TextareaSize size;
  final TextareaState state;
  final String? placeholder;
  final String? label;
  final String? errorMessage;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool isRequired;
  TextareaDelegate? delegate;

  TextareaViewModel({
    required this.size,
    required this.state,
    this.delegate,
    this.placeholder,
    this.label,
    this.errorMessage,
    this.minLines,
    this.maxLines = 5,
    this.maxLength,
    this.isRequired = false,
  });
}
