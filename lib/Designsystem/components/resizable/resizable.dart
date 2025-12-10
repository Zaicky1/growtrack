import 'package:flutter/material.dart';

class GTResizable extends StatefulWidget {
  final Widget child;
  final double initialHeight;

  const GTResizable({Key? key, required this.child, this.initialHeight = 200})
    : super(key: key);

  @override
  _GTResizableState createState() => _GTResizableState();
}

class _GTResizableState extends State<GTResizable> {
  late double height;

  @override
  void initState() {
    super.initState();
    height = widget.initialHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height, child: widget.child),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (d) => setState(
            () => height = (height + d.delta.dy).clamp(50.0, 1000.0),
          ),
          child: Container(height: 12, color: Colors.transparent),
        ),
      ],
    );
  }
}
