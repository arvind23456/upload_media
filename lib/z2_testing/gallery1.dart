// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:mango/z2_testing/4th_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gallery1(),
  ));
}

class Gallery1 extends StatelessWidget {
  const Gallery1({super.key});

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(
                context,
              );
            },
            child: Icon(
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
                        builder: (context) => CreatePost(),
                      ));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                )),
            SizedBox(
              width: 3,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Photos"),
              Tab(text: "Album"),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 7,
                  mainAxisExtent: 170,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: arrNames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("${arrNames[index]}"),
                      ),
                      Container(
                        child: Text(
                          '1234',
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Image.asset(
                            "${arrImages[index]}",
                            fit: BoxFit.cover,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
