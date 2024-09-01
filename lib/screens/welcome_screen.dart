import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:flutter_neon_template/widgets/custom_scaffold.dart';
import 'package:flutter_neon_template/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome Back!\n',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: 'Enter your details to continue',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            WelcomeButton(
              buttonText: 'Sign in',
              onTap: const SignInScreen(),
              color: colorScheme.primary.withOpacity(0.1),
              textColor: colorScheme.primary,
            ),
            const SizedBox(height: 16.0),
            WelcomeButton(
              buttonText: 'Sign up',
              onTap: const SignUpScreen(),
              color: colorScheme.primary,
              textColor: colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
