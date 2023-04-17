import 'dart:async';

import 'package:flutter/material.dart';

import '../../widget/welcome_box.dart';
import '../../widget/yellow_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/welcome');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBackground(
        child: Center(
          child: welcomeBox(),
        ),
      ),
    );
  }
}
