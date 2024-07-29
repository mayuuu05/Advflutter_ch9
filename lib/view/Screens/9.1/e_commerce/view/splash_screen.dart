import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () async {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo.png',height: 200,)),
    );
  }
}
