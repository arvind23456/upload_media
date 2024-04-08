import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mango/flow2/page3.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gallery(),
  ));
}

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    List<XFile> postImg = [];

    void _loadGalleryImages() async {
      final List<XFile> images = await ImagePicker().pickMultiImage();
      setState(() {
        postImg = images;
      });
    }

    var arrNames = [
      'Camera',
      'Download',
      'Screenshots',
      'Snapchat',
      'Facebook',
      'Collage'
    ];
    var arrImages = [
      'assets/images/Group 10971.png',
      'assets/images/Group 10972.png',
      'assets/images/Group 10973.png',
      'assets/images/Group 10974.png',
      'assets/images/Group 10975.png',
      'assets/images/Group 10976.png',
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  print('image uploaded ');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Videopost(),
                      ));
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                )),
            const SizedBox(
              width: 3,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Photos"),
              Tab(text: " Album"),
              Tab(text: "Videos"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: TabBarView(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset('assets/images/Rectangle 5050.png',
                        fit: BoxFit.cover),
                  );
                },
                itemCount: 21,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 170),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: arrNames.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("${arrNames[index]}"),
                      ),
                      Container(
                        child: const Text(
                          '1234',
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _loadGalleryImages();
                          },
                          child: Container(
                            child: Image.asset(
                              "${arrImages[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              GridView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(
                      'assets/images/Rectangle 5055.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 9,
                    mainAxisExtent: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
