import 'package:flutter/material.dart';

class GTSkeleton extends StatelessWidget {
  final double height;
  final double width;

  const GTSkeleton({Key? key, this.height = 12, this.width = double.infinity})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, color: Colors.grey.shade300);
  }
}
