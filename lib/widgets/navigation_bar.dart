import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottumNavigationBar extends StatefulWidget {
  const BottumNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() => _BottumNavigationBarState();
}

class _BottumNavigationBarState extends State<BottumNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {

      },
      selectedIndex: currentPageIndex,
      destinations: [],
    );
  }
}
