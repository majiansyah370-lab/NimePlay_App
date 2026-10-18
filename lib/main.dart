import 'package:flutter/material.dart';
import 'core/theme/neo_theme.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const NimeplayApp());
}

class NimeplayApp extends StatelessWidget {
  const NimeplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NimePlay',
      debugShowCheckedModeBanner: false,
      theme: NeoTheme.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}
