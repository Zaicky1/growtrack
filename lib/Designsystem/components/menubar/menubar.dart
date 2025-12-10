import 'package:flutter/material.dart';

class GTMenubar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const GTMenubar({Key? key, this.actions = const []}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: actions);
  }
}
