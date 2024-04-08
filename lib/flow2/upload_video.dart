import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class Upload_Video extends StatefulWidget {
  const Upload_Video({super.key});

  @override
  State<Upload_Video> createState() => _Upload_VideoState();
}

class _Upload_VideoState extends State<Upload_Video> {
  List<XFile> postVideo = [];

  VideoPlayerController? _controller;

  void _pickVideooFromgallery() async {
    final XFile? videos =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (videos != null) {
      setState(() {
        postVideo.add(videos);
        _controller = VideoPlayerController.file(File(videos.path))
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });
      });
    } else {
      print('no video found');
    }
  }

  /* void _pickVideooFromgallery() async {
    final XFile? videos =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    setState(() {
      postVideo.add(videos!);
    });
    _controller = VideoPlayerController.file(File(videos!.path));
    _controller?.initialize();
    _controller?.setLooping(true);
    _controller?.play();
  }
*/
  /* void _loadGalleryImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    setState(() {
      postImg = images;
    });
    Navigator.pop(context);
  }

  void _addmore() async {
    final List<XFile> imagess = await ImagePicker().pickMultiImage();
    setState(() {
      postImg.addAll(imagess);
    });
    Navigator.pop(context);
  }

  void _camera() async {
    final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    setState(() {
      if (image != null) {
        postImg.add(image);
      }
    });
    Navigator.pop(context);
  } */

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
                    width: 1, color: Color.fromRGBO(235, 232, 255, 0.75))),
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                const Positioned(
                  left: 12,
                  top: 12,
                  child: Text('Upload Video'),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        _pickVideooFromgallery();
                      },
                      child: Image.asset('assets/images/Vector.png')),
                ),
              ],
            ),
          ),
        if (postVideo.isNotEmpty)
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postVideo.length,
              itemBuilder: (context, index) {
//
/*
                if ((index == postVideo.length)) {
                  return TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                                height: 180,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              _pickVideoFromCamera();
                                            },
                                            icon: const Icon(
                                              Icons.camera,
                                              size: 70,
                                            )),
                                        const Text('Camera'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _pickVideoFromgallery();
                                            },
                                            icon: const Icon(
                                              Icons.folder,
                                              color: Colors.lightBlue,
                                              size: 70,
                                            ),
                                          ),
                                          const Text('Files'),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 230,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(87, 89, 96, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/Vector.png',
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45, top: 28),
                            child: Center(
                              child: Text(
                                'Add More',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
*/
                //
                return Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1 - 12,
                    margin: EdgeInsets.all(3),
                    child: Stack(children: [
                      if (_controller != null)
                        InkWell(
                          onTap: () {
                            if (_controller!.value.isPlaying) {
                              _controller!.pause();
                            } else {
                              _controller!.play();
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            postVideo.removeAt(index);
                          });
                        },
                      ),
                    ]),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
    
 
 
 






/* import 'package:flutter/material.dart';
import 'package:upload_flow/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class Upload_Video extends StatefulWidget {
  const Upload_Video({super.key});

  @override
  State<Upload_Video> createState() => _Upload_VideoState();
}

class _Upload_VideoState extends State<Upload_Video> { 

  
  List<XFile> postImg = [];

  void _loadGalleryImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    setState(() {
      postImg = images;
    });
    Navigator.pop(context);
  }

  void _addmore() async {
    final List<XFile> imagess = await ImagePicker().pickMultiImage();
    setState(() {
      postImg.addAll(imagess);
    });
    Navigator.pop(context);
  }

  void _camera() async {
    final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    setState(() {
      if (image != null) {
        postImg.add(image);
      }
    });
    Navigator.pop(context);
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (postImg.isEmpty)
          Container(
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: MainScreen.border)),
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                const Positioned(
                  left: 12,
                  top: 12,
                  child: Text('Upload Photo'),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: MainScreen.textfieldcolor,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Container(
                                  height: 180,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                _camera();
                                              },
                                              icon: const Icon(
                                                Icons.camera,
                                                size: 70,
                                              )),
                                          const Text('Camera'),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _loadGalleryImages();
                                              },
                                              icon: const Icon(
                                                Icons.folder,
                                                color: Colors.lightBlue,
                                                size: 70,
                                              ),
                                            ),
                                            const Text('Files'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        );
                      },
                      child: Image.asset('assets/images/Vector.png')),
                ),
              ],
            ),
          ),
        if (postImg.isNotEmpty)
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postImg.length + 1,
              itemBuilder: (context, index) {
//

                if ((index == postImg.length)) {
                  return TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: MainScreen.textfieldcolor,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                                height: 180,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              _camera();
                                            },
                                            icon: const Icon(
                                              Icons.camera,
                                              size: 70,
                                            )),
                                        const Text('Camera'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _addmore();
                                            },
                                            icon: const Icon(
                                              Icons.folder,
                                              color: Colors.lightBlue,
                                              size: 70,
                                            ),
                                          ),
                                          const Text('Files'),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(87, 89, 96, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/Vector.png',
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 45, top: 40),
                          child: Center(
                            child: Text(
                              'Add More',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                //
                return Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Image.file(
                        File(postImg[index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      setState(() {
                        postImg.removeAt(index);
                      });
                    },
                  ),
                ]);
              },
            ),
          ),
      ],
    );
  }
}
    */ 