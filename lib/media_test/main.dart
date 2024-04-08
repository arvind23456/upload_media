import 'package:flutter/material.dart';
import 'package:mango/media_test/ui/screens/home_screen.dart';

// Entry point of the application
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Set HomeScreen as the home page of the MaterialApp
      home: media_upload(),
    );
  }
}
