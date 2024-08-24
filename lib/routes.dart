import 'package:flutter_neon_template/main.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Hello World'),
    ),
    GoRoute(
      name: 'profile',
      path: '/profile',
      builder: (context, state) => const MyHomePage(title: 'Hello World 1'),
    ),
  ],
);