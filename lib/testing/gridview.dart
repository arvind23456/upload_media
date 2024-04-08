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
                text: " video",
              ),
            ],
          ),
        ),
        body: GridView.builder(
          itemBuilder: (context, index) {
            return Container(
              color: arrColors[index],
            );
          },
          itemCount: arrColors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
        ),
      ),
    );
  }
}
