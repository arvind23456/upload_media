// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  var emailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        shape: Border.all(width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
        title: Text('Create Post'),
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  print("image uploaded");
                }),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              child: TextField(
                controller: emailText,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.pinkAccent)),
                    suffixText: "username exists ",
                    hintText: 'enter email',
                    suffixIcon: IconButton(
                      icon:
                          Icon(Icons.remove_red_eye, color: Colors.pinkAccent),
                      onPressed: () {
                        print('eye opened');
                      },
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.pinkAccent,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
