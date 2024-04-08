import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: Pickimages(),
  ));
}

class Pickimages extends StatefulWidget {
  const Pickimages({super.key});

  @override
  State<Pickimages> createState() => _PickImageState();
}

class _PickImageState extends State<Pickimages> {
  @override
  List<XFile> postImg = [];
  void _loadGalleryImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    setState(() {
      postImg = images;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _loadGalleryImages, child: Text('pick image')),
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
            )
          ],
        ),
      ),
    );
  }
}
