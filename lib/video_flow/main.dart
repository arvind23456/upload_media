// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mango/image_flow/splash_screen.dart';
import 'package:mango/video_flow/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoFlow(),
  ));
}

class VideoFlow extends StatelessWidget {
  const VideoFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen1();
  }
}
