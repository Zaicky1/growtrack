import 'package:flutter/material.dart';

abstract class FormDelegate {
  void onSubmit(Map<String, dynamic> formData);
  void onReset();
}

class FormFieldViewModel {
  final String name;
  final String label;
  final String? value;
  final String? errorMessage;
  final bool isRequired;
  final bool isDisabled;

  FormFieldViewModel({
    required this.name,
    required this.label,
    this.value,
    this.errorMessage,
    this.isRequired = false,
    this.isDisabled = false,
  });
}

class FormViewModel {
  final List<FormFieldViewModel> fields;
  final String submitLabel;
  final String resetLabel;
  FormDelegate? delegate;

  FormViewModel({
    required this.fields,
    this.delegate,
    this.submitLabel = 'Submit',
    this.resetLabel = 'Reset',
  });
}
