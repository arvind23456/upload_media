// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mango/flow2/add_location.dart';
import 'package:mango/flow2/add_title.dart';
import 'package:mango/flow2/caption.dart';
import 'package:mango/flow2/category_list.dart';
import 'package:mango/flow2/page2.dart';
import 'package:mango/flow2/tag_friends.dart';

void main() {
  runApp(Videopost());
}

class Videopost extends StatelessWidget {
  const Videopost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          shape: Border(
              bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 239, 239, 1),
          )),
          toolbarHeight: 85,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, 'return to data');
            },
          ),
          title: Text("Create Post"),
          titleSpacing: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                onPressed: () {
                  print("Video Uploaded");
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Stack(children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/Rectangle 5042 (1).png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 180),
                    child: Container(
                        child: Image.asset('assets/images/video.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14, left: 380),
                    child: Container(
                      child: Image.asset('assets/images/delete.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(241, 239, 239, 1),
                      ),
                    ),
                  ),
                  child: Addtitle(),
                ),
              ),
              Category(),
              Caption(),
              Addlocation(),
              Tagfriends(),
            ],
          ),
        ),
      ),
    );
  }
}
