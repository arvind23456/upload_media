import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mango/utils/icons.dart';

void main() {
  runApp(const MaterialApp(home: Upload_Photo()));
}

class Upload_Photo extends StatefulWidget {
  const Upload_Photo({super.key});

  @override
  State<Upload_Photo> createState() => _Upload_PhotoState();
}

class _Upload_PhotoState extends State<Upload_Photo> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        if (postImg.isEmpty)
          Stack(
            children: [
              Container(
                width: 396,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.only(top: 7, left: 9),
                  child: Text('Upload Photo'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(241, 239, 239, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 25),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _camera();
                                        },
                                        icon: const Icon(
                                          Icons.camera,
                                          size: 70,
                                        ),
                                      ),
                                      const Text('Camera'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 25),
                                  child: Container(
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
                                            )),
                                        const Text('Files'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Logoicon.upload,
                  ),
                ),
              ),
            ],
          ),
        if (postImg.isNotEmpty)
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postImg.length + 1,
              itemBuilder: (context, index) {
                if ((index == postImg.length)) {
                  return TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
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
                          width: 177,
                          height: 241,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(87, 89, 96, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Vector.png',
                                  color: Colors.white,
                                ),
                                const Text(
                                  'Add More',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Image.file(
                          File(postImg[index].path),
                          height: 400,
                        )),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            postImg.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ]),
    );
  }
}
