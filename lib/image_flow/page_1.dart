import 'package:flutter/material.dart';

import 'package:mango/video_flow/add_location.dart';
import 'package:mango/video_flow/caption.dart';
import 'package:mango/video_flow/tag_friends.dart';
import 'package:mango/image_flow/upload_photo.dart';

class DashBoardScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
          toolbarHeight: 85,
          backgroundColor: Colors.white,
          title: const Text("Create Post"),
          leading: const Icon(Icons.arrow_back),
          actions: [
            InkWell(
              onTap: () {
                print('upload images');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 80,
                height: 31,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ]),
      body: const SingleChildScrollView(
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
