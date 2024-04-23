
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mango/utils/icons.dart';
import 'package:mango/utils/textcolor.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  List<XFile> postVideo = [];

  VideoPlayerController? _controller;

  bool isPlaying = false;

  void _pickVideooFromgallery() async {
    final XFile? video =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        postVideo.add(video);
        _controller = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {});

            isPlaying = false;
          });
      });
    } else {
      print('No video selected.');
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (postVideo.isEmpty)
          Container(
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
              width: 1,
              color: const Color.fromRGBO(241, 239, 239, 1),
            )),
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                const Positioned(
                  left: 12,
                  top: 12,
                  child: Text(
                    'Upload Video',
                    style: Textcolor.fontsizecolor,
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        _pickVideooFromgallery();
                      },
                      child: Logoicon.upload),
                ),
              ],
            ),
          ),
        if (postVideo.isNotEmpty)
          SizedBox(
            height: 245,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postVideo.length,
              itemBuilder: (context, index) {
//

                //

                return Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1 - 5,
                    margin: const EdgeInsets.all(3),
                    child:
                        /* Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_controller!.value.isPlaying) {
                                    _controller!.pause();
                                  } else {
                                    _controller!.play();
                                  }
                                });
                              },
                              child: isPlaying
                                  ? Container() // Empty container to cover the video for tap
                                  : Center(
                                      child: IconButton(
                                        icon: Icon(Icons.play_circle_fill),
                                        iconSize: 50,
                                        onPressed: () {
                                          setState(() {
                                            _controller!.play();
                                          });
                                        },
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                                icon: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    postVideo.removeAt(index);
                                  });
                                }),
                          ),
                        ],
                      ), */

                        Center(
                      child: Stack(children: [
                        AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: isPlaying
                                  ? const Icon(
                                      Icons.pause_circle_filled_outlined,
                                      color:
                                          Color.fromRGBO(146, 146, 149, 0.89),
                                      size: 40,
                                    )
                                  : const Icon(
                                      Icons.play_circle_fill,
                                      color:
                                          Color.fromRGBO(146, 146, 149, 0.89),
                                      size: 40,
                                    ),
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
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(146, 146, 149, 0.89),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                postVideo.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
    


   /*   return Center(
                  child: Container(
                    
                  
                    child: Stack(children: [
                      if (_controller!.value.isInitialized)
                        AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                _controller!.play();
                              }
                            });
                          },
                          child: _controller!.value.isPlaying
                              ? Container() // Empty container to cover the video for tap
                              : const Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
 
 */

/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mango/utils/textcolor.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  List<XFile> postVideo = [];

  List<VideoPlayerController?> _controllers = [];

  void _pickVideoFromGallery() async {
    final XFile? video =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        postVideo.add(video);
        _controllers.add(
          VideoPlayerController.file(File(video.path))
            ..initialize().then((_) {
              setState(() {});
            }),
        );
      });
    } else {
      print('No video found');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (postVideo.isEmpty)
          Container(
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(235, 232, 255, 0.75),
              ),
            ),
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                const Positioned(
                  left: 12,
                  top: 12,
                  child: Text(
                    'Upload Video',
                    style: Textcolor.fontsizecolor,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      _pickVideoFromGallery();
                    },
                    child: Image.asset('assets/images/Vector.png'),
                  ),
                ),
              ],
            ),
          ),
        if (postVideo.isNotEmpty)
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postVideo.length,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(
                  videoFile: File(postVideo[index].path),
                  controller: _controllers[index],
                  onDelete: () {
                    setState(() {
                      postVideo.removeAt(index);
                      _controllers[index]?.dispose();
                      _controllers.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;
  final VideoPlayerController? controller;
  final VoidCallback onDelete;

  const VideoPlayerWidget({
    required this.videoFile,
    required this.controller,
    required this.onDelete,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller!;
    _controller.addListener(() {
      if (_controller.value.isPlaying != isPlaying) {
        setState(() {
          isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1 - 5,
        margin: EdgeInsets.all(3),
        child: Center(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();

                    }
                  });
                },
                child: isPlaying
                    ? Container()
                    : Center(
                        child: IconButton(
                          icon: const Icon(Icons.play_circle_fill,
                              color: Color.fromRGBO(146, 146, 149, 0.89)),
                          iconSize: 50,
                          onPressed: () {
                            setState(() {
                              _controller.play();
                            });
                          },
                        ),
                      ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: Icon(Icons.play_arrow_outlined)),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(146, 146, 149, 0.89),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: widget.onDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}




*/
 






