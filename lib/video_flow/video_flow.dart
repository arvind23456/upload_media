import 'package:flutter/material.dart';
import 'package:mango/video_flow/add_location.dart';
import 'package:mango/video_flow/add_title.dart';
import 'package:mango/video_flow/caption.dart';
import 'package:mango/video_flow/category_list.dart';

import 'package:mango/video_flow/tag_friends.dart';

import 'package:mango/video_flow/upload_video.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoFlow(),
  ));
}

class VideoFlow extends StatefulWidget {
  VideoFlow({super.key});

  @override
  State<VideoFlow> createState() => VideoFlowState();
}

class VideoFlowState extends State<VideoFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        )),
        leading: const Icon(Icons.arrow_back),
        title: const Text('Create Post'),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                print("post uploaded");
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            UploadVideo(),
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
