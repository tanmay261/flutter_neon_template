import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neon_template/bloc/profile/profile_bloc.dart';
import 'package:flutter_neon_template/routes.dart';
import 'package:flutter_neon_template/themes/theme.dart';
import 'package:flutter_neon_template/utils/neon_connection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neon_template/providers/theme_provider.dart'; // Import your ThemeProvider

late final PostgresManager postgresConnectionManager;
const secureStorage = FlutterSecureStorage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Initialize and connect to Postgres
  postgresConnectionManager = PostgresManager();
  await postgresConnectionManager.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserProfileBloc>(
            create: (BuildContext context) => UserProfileBloc(),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (_) => ThemeProvider(), // Initialize ThemeProvider
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp.router(
                title: 'Flutter Demo',
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: lightMode,
                darkTheme: darkMode,
                themeMode:
                    themeProvider.themeMode, // Use ThemeProvider for themeMode
              );
            },
          ),
        ));
  }
}
