import 'package:flutter/material.dart';
import 'package:flutter_neon_template/routes.dart';
import 'package:flutter_neon_template/themes/theme.dart';
import 'package:flutter_neon_template/utils/neon_connection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

late final PostgresManager postgresConnectionManager;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // make sure the env is loaded before connecting
  postgresConnectionManager = PostgresManager();
  await postgresConnectionManager.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
    );
  }
}
