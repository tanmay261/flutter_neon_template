import 'package:flutter_neon_template/screens/feed_screen.dart';
import 'package:flutter_neon_template/screens/home_screen.dart';
import 'package:flutter_neon_template/screens/login_screen.dart';
import 'package:flutter_neon_template/screens/profile_screen.dart';
import 'package:flutter_neon_template/screens/settings_screen.dart';
import 'package:flutter_neon_template/screens/signup_screen.dart';
import 'package:flutter_neon_template/screens/splash_screen.dart';
import 'package:flutter_neon_template/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        name: 'welcome',
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen()),
    GoRoute(
      name: 'signin',
      path: "/signin",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: 'signup',
      path: "/signup",
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
        name: 'feed',
        path: '/feed',
        builder: (context, state) => const FeedScreen()),
    GoRoute(
        name: 'setting',
        path: '/setting',
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
      name: 'profile',
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
