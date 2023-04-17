import 'package:baitap_ui/screen_size.dart';
import 'package:flutter/material.dart';

import 'ui/login/login_screen.dart';
import 'ui/register/register_screen.dart';
import 'ui/welcome/splash_screen.dart';
import 'ui/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: const MaterialColor(0xFFFFB900, {
          50: Color(0xFFFFF7E0),
          100: Color(0xFFFFECB3),
          200: Color(0xFFFFE082),
          300: Color(0xFFFFD54F),
          400: Color(0xFFFFCA28),
          500: Color(0xFFFFB900),
          600: Color(0xFFFFB300),
          700: Color(0xFFFFA000),
          800: Color(0xFFFF8F00),
          900: Color(0xFFFF6F00),
        }),
      ),
      home: const MyHomePage(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}
