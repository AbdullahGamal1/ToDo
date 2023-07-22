import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/splash/splash.png', fit: BoxFit.fill),
    );
  }
}
