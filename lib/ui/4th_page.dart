// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mango/flow2/add_location.dart';
import 'package:mango/flow2/tag_friends.dart';
import 'package:mango/ui/gallery1.dart';
import 'package:mango/ui/tagfriend1.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CreatePost()));
}

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterApp",
      debugShowCheckedModeBanner: false,
      home: AddMore(),
    );
  }
}

class AddMore extends StatelessWidget {
  const AddMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        shape: Border.all(width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
        title: Text('Create Post'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Gallery1(),
                ));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                print('icon clicked');
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Stack(children: [
                      Container(
                        child: Image.asset('assets/images/Rectangle 5042.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 155, top: 10),
                        child: Container(
                          child: Image.asset('assets/images/Group 10988.png'),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        Container(
                          width: 140,
                          height: 234,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(87, 89, 96, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/Vector.png',
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 135),
                          child: Text(
                            'Add More',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 13,
                right: 5,
                top: 20,
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
                    top: BorderSide(
                        width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                      '"Many of life’s failures are people who did not realize how close they were to when  gave up." "Everybody wants to be famous, but nobody wants to do the work. I live by that. You grind hard so you can play hard. At the end of the day, you put all the work in, and eventually it’ll pay off. It could be in a year, it could be in 30 years. Eventually, your hard work will pay off." "Many of life’s failures are people who did not realize how close they were to when  gave up." "Everybody wants to be famous, but nobody wants to do the work. I live by that. You grind hard so you can play hard. At the end of the day, you put all the work in, and eventually it’ll pay off. It could be in a year, it could be in 30 years. Eventually, your hard work will pay off."'),
                ),
              ),
            ),
            Addlocation(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
                ),
              ),
            ),
            Tagfriends1(),
          ],
        ),
      ),
    );
  }
}
