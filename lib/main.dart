import 'package:flutter/material.dart';

import 'package:mango/video_flow/splash_screen.dart';

void main() {
  runApp(const MaterialApp(
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
