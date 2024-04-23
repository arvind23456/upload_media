import 'package:flutter/material.dart';
import 'package:mango/image_flow/splash_screen.dart';

void main() {
  runApp(FlutterApps());
}

class FlutterApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " FlutterApps",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
