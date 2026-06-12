import 'package:flutter/cupertino.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const SistemaAlumnosApp());
}

class SistemaAlumnosApp extends StatelessWidget {
  const SistemaAlumnosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Sistema de Alumnos',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const LoginScreen(),
        '/menu': (ctx) => const MenuScreen(),
      },
    );
  }
}