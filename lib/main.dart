import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_manager/config/injection.dart';
import 'package:user_manager/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ProviderScope(child: StatefulShellRouteApp()));
}

class RootApp extends StatelessWidget {
  const RootApp({super.key, required this.navigationShell});

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
