// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements

import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " FlutterApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrColors = [
      Colors.red,
      Colors.orange,
      Colors.blueGrey,
      Colors.pink,
      Colors.blue,
      Colors.black,
      Colors.purple,
      Colors.green,
      Colors.brown,
      Colors.purpleAccent,
      Colors.blue,
      Colors.black26,
      Colors.yellow,
      Colors.grey,
      Colors.orange,
      Colors.pinkAccent,
      Colors.redAccent,
      Colors.brown,
      Colors.lightBlue,
      Colors.black12,
      Colors.orangeAccent,
    ];
    var arrNames = [
      'Camera',
      'Downloads',
      'data',
      'Snapchat',
      'Facebook',
      'Collage',
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
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
          actions: [
            Icon(Icons.camera_alt_rounded),
            SizedBox(
              width: 20,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Photos",
              ),
              Tab(
                text: "Album",
              ),
              Tab(
                text: "Videos",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: TabBarView(children: [
            GridView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    'assets/images/Rectangle 5048.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: arrColors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
              ),
            ),
            GridView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("${arrNames[index]}"),
                            ),
                            Container(
                              child: Text(
                                '1234',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 11),
                              ),
                            ),
                            Center(
                              child: Expanded(
                                flex: 9,
                                child: Container(
                                  child: Image.asset(
                                    "${arrImages[index]}",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                },
                itemCount: arrNames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 0.9)),
            GridView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    'assets/images/Rectangle 5056.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: arrColors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  mainAxisExtent: 200),
            )
          ]),
        ),
      ),
    );
  }
}
