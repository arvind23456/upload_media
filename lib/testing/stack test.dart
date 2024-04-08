// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " FlutterApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Create Post"),
          leading: Icon(Icons.arrow_back),
          actions: [
            InkWell(
              onTap: () {
                print('upload images');
              },
              child: Container(
                margin: EdgeInsets.only(right: 15),
                width: 80,
                height: 31,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Post')),
              ),
            )
          ]),
      body: Stack(children: [
        Container(
          width: 393,
          height: 196,
          color: Color.fromARGB(255, 242, 241, 241),
        ),
        Container(
          width: 106,
          height: 16,
          child: Text('Upload Photo'),
        ),
        Positioned(
          left: 180,
          top: 80,
          child: Container(
            width: 26,
            height: 26,
            child: Image.asset('assets/images/Vector.png'),
          ),
        ),
      ]),
    );
  }
}
