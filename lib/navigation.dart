import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_manager/main.dart';
import 'package:user_manager/views/auth/login.dart';
import 'package:user_manager/views/home.dart';

class StatefulShellRouteApp extends StatelessWidget {
  const StatefulShellRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: "First Flutter App", routerConfig: routes);
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
            return App(navigationShell: navigationShell);
          },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/",
              builder: (context, state) =>
                  const HomePage(title: 'Flutter Demo Home Page'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/login",
              builder: (context, state) => const LoginPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
