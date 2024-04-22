// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mango/video_flow/add_location.dart';
import 'package:mango/video_flow/caption.dart';
import 'package:mango/video_flow/tag_friends.dart';
import 'package:mango/image_flow/upload_photo.dart';

void main() {
  runApp(FlutterApps());
}

class FlutterApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " FlutterApps",
      debugShowCheckedModeBanner: false,
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
          toolbarHeight: 85,
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
                child: Center(
                    child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Upload_Photo(),
            Caption(),
            Addlocation(),
            Tagfriends(),
          ],
        ),
      ),
    );
  }
}
