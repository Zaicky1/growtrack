import 'package:flutter/material.dart';

class GTLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool isRequired;

  const GTLabel({
    Key? key,
    required this.text,
    this.style,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: style ?? Theme.of(context).textTheme.bodyMedium,
          ),
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
