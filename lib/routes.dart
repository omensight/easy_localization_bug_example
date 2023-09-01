import 'package:easy_localization_bug_example/main_navigation_view.dart';
import 'package:easy_localization_bug_example/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouterProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        routes: [
          GoRoute(path: '/', builder: (buildContext, state) => const MainPage())
        ],
        builder: (context, state, child) {
          return MainNavigationView(
            state: state,
            child: child,
          );
        },
        navigatorKey: shellNavigatorKey,
      ),
    ],
  ),
);
