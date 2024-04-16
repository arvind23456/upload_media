import 'package:flutter/material.dart';
import 'package:mango/flow2/add_location.dart';
import 'package:mango/flow2/add_title.dart';
import 'package:mango/flow2/caption.dart';
import 'package:mango/flow2/category_list.dart';

import 'package:mango/flow2/tag_friends.dart';

import 'package:mango/flow2/upload_video.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: flow1(),
  ));
}

class flow1 extends StatefulWidget {
  flow1({super.key});

  @override
  State<flow1> createState() => _flow1State();
}

class _flow1State extends State<flow1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        )),
        leading: Icon(Icons.arrow_back),
        title: Text('Create Post'),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                print("image posted");
              },
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
            Upload_Video(),
            Addtitle(),
            Category(),
            Caption(),
            Addlocation(),
            Tagfriends(),
          ],
        ),
      ),
    );
  }
}
