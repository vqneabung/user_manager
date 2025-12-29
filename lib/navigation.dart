import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_manager/main.dart';
import 'package:user_manager/views/auth/login.dart';
import 'package:user_manager/widgets/navigation_bar.dart';

// final routes = GoRouter(
//   routes: [
//     GoRoute(
//       path: "/",
//       builder: (context, state) =>
//           const HomePage(title: 'Flutter Demo Home Page'),
//     ),
//     GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
//   ],
// );

class StatefulShellRouteApp extends StatelessWidget {
  const StatefulShellRouteApp({super.key});


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

final routes = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return BottumNavigationBar(navigationShell: navigationShell);
          },
      branches: [StatefulShellBranch(routes: [])],
    ),
  ],
);
