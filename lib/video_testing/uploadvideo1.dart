import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo1 extends StatefulWidget {
  const UploadVideo1({Key? key}) : super(key: key);

  @override
  State<UploadVideo1> createState() => _UploadVideo1State();
}

class _UploadVideo1State extends State<UploadVideo1> {
  VideoPlayerController? _controller;
  List<XFile> postImg = [];
  bool isPlaying = false;

  void _addVideo() async {
    final XFile? video =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        postImg.add(video);
        _controller = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {});
            // Set isPlaying to false when video is initialized
            isPlaying = false;
          });
      });
    } else {
      print('No video selected.');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          if (postImg.isEmpty)
            Stack(
              children: [
                Container(
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: _addVideo,
                      icon: Icon(Icons.abc),
                    ),
                  ),
                ),
              ],
            )
          else
            Stack(
              children: [
                Container(
                  height: 235,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: postImg.length + 1,
                          itemBuilder: (context, int index) {
                            if (index == postImg.length) {
                              return Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: _addVideo,
                                      icon: const Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const Text('add more'),
                                  ],
                                ),
                              );
                            }
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: _controller!.value.aspectRatio,
                                    child: VideoPlayer(_controller!),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                        icon: isPlaying
                                            ? Icon(Icons.pause)
                                            : Icon(Icons.play_circle_fill),
                                        onPressed: () {
                                          if (isPlaying) {
                                            _controller!.pause();
                                          } else {
                                            _controller!.play();
                                          }
                                          setState(() {
                                            isPlaying = !isPlaying;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        postImg.removeAt(index);
                                      });
                                    },
                                    icon: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(
                                        Icons.delete_sharp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}


/*



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo1 extends StatefulWidget {
  const UploadVideo1({Key? key}) : super(key: key);

  @override
  State<UploadVideo1> createState() => _UploadVideo1State();
}

class _UploadVideo1State extends State<UploadVideo1> {
  VideoPlayerController? _controller;
  XFile? postVideo;
  bool isPlaying = false;
  bool showControls = false;

  void _addVideo() async {
    final XFile? video =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        postVideo = video;
        _controller = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
            isPlaying = true;
          })
          ..addListener(() {
            if (_controller!.value.isPlaying && !isPlaying) {
              setState(() {
                isPlaying = true;
                showControls = false;
              });
            } else if (!_controller!.value.isPlaying && isPlaying) {
              setState(() {
                isPlaying = false;
                showControls = true;
              });
            }
          });
      });
    } else {
      print('No video selected.');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void toggleControlsVisibility() {
    setState(() {
      showControls = !showControls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          if (postVideo == null)
            Stack(
              children: [
                Container(
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: _addVideo,
                      icon: Icon(Icons.abc),
                    ),
                  ),
                ),
              ],
            )
          else
            GestureDetector(
              onTap: () {
                if (_controller!.value.isPlaying) {
                  setState(() {
                    _controller!.pause();
                    showControls = true;
                  });
                } else {
                  setState(() {
                    _controller!.play();
                    showControls = false;
                  });
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: 235,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
                  Visibility(
                    visible: showControls,
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: isPlaying
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow),
                        onPressed: () {
                          if (isPlaying) {
                            _controller!.pause();
                          } else {
                            _controller!.play();
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
*/