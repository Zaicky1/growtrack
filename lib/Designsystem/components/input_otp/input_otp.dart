import 'package:flutter/material.dart';

class GTInputOtp extends StatelessWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const GTInputOtp({Key? key, this.length = 4, this.onCompleted})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = List.generate(length, (_) => TextEditingController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (i) => SizedBox(
          width: 48,
          child: TextField(
            controller: controllers[i],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (v) {
              if (v.isNotEmpty && i + 1 < length) {
                FocusScope.of(context).nextFocus();
              }
              final value = controllers.map((c) => c.text).join();
              if (value.length == length) onCompleted?.call(value);
            },
          ),
        ),
      ),
    );
  }
}
