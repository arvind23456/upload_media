// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mango/flow2/page1.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Video_Flow(),
  ));
}

class Video_Flow extends StatelessWidget {
  const Video_Flow({super.key});

  @override
  Widget build(BuildContext context) {
    return flow1();
  }
}
