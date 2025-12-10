import 'package:flutter/material.dart';

class GTTabs extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> views;

  const GTTabs({Key? key, required this.tabs, required this.views})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(tabs: tabs),
          Expanded(child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
