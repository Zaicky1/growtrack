import 'package:flutter/material.dart';

class GTHoverCard extends StatefulWidget {
  final Widget child;
  final Widget? hoverContent;

  const GTHoverCard({Key? key, required this.child, this.hoverContent})
    : super(key: key);

  @override
  _GTHoverCardState createState() => _GTHoverCardState();
}

class _GTHoverCardState extends State<GTHoverCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          if (hovering && widget.hoverContent != null) widget.hoverContent!,
        ],
      ),
    );
  }
}
