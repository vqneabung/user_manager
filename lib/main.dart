import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_manager/navigation.dart';

Future<void> main() async {
  runApp(const StatefulShellRouteApp());
}

class App extends StatelessWidget {
  const App({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint(
      "Navigation Branches Length: ${navigationShell.route.branches.length}",
    );

    return Scaffold(
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int tappedIndex) {
          navigationShell.goBranch(tappedIndex);
        },
      ),
    );
  }
}
