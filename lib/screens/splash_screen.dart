import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neon_template/main.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () async {
      if (await doesUserIdExist() && mounted) {
        GoRouter.of(context).go('/home');
      } else if (mounted) {
        GoRouter.of(context).go('/welcome');
      }
    });
  }

  Future<bool> doesUserIdExist() async {
    String? userId = await secureStorage.read(key: 'user_id');
    return userId != null;
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.pink],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.edit,
            size: 80,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
