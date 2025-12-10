import 'package:flutter/material.dart';

class GTAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const GTAvatar({Key? key, this.imageUrl, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(radius: size / 2);
    }
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(imageUrl!),
    );
  }
}
