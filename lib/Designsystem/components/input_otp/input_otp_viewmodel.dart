import 'package:flutter/material.dart';

abstract class InputOtpDelegate {
  void onCompleted(String code);
  void onChanged(String code);
}

class InputOtpViewModel {
  final int length;
  final String? placeholder;
  final bool obscureText;
  final TextInputType inputType;
  InputOtpDelegate? delegate;

  InputOtpViewModel({
    required this.length,
    this.delegate,
    this.placeholder,
    this.obscureText = false,
    this.inputType = TextInputType.number,
  });
}
