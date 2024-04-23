// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: PickImage(),
  ));
}

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  List<XFile> postImg = [];

  void _loadGalleryImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    setState(() { 
      
      postImg = images;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.blue.shade100,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 25),
                            child: IconButton(
                              onPressed: () {
                                _camera();
                              },
                              icon: Icon(
                                Icons.camera,
                                size: 70,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 25),
                            child: Container(
                              child: IconButton(
                                  onPressed: () {
                                    _loadGalleryImages();
                                  },
                                  icon: Icon(
                                    Icons.folder,
                                    color: Colors.lightBlue,
                                    size: 70,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.asset('assets/images/Vector.png'),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: postImg.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    File(postImg[index].path),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
