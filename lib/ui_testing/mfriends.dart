// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mango/video_flow/add_location.dart';
import 'package:mango/video_flow/tag_friends.dart';

void main() {
  runApp(Friends());
}

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape:
              Border.all(width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
          title: Text('Create Post'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, 'return to data');
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18, top: 1),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    print('button is clicked');
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 12,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(235, 232, 255, 0.75)))),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              child: Image.asset(
                                  'assets/images/Rectangle 5042.png')),
                          Padding(
                            padding: const EdgeInsets.only(left: 153, top: 12),
                            child: Container(
                              child:
                                  Image.asset('assets/images/Group 10988.png'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Stack(children: [
                          Container(
                            width: 135,
                            height: 234,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color.fromRGBO(87, 89, 96, 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 63, top: 90),
                            child: Container(
                              child: Image.asset(
                                'assets/images/Vector.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 120, left: 40),
                            child: Container(
                              child: Text(
                                ' Add More',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: TextField(
                    maxLines: null,
                    minLines: 7,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        hintText: 'Captions',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                Addlocation(),
                Padding(
                  padding: const EdgeInsets.only(top: 17, left: 11),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset('assets/images/tag.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.pink),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Mike smith*'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.pink),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Mike smith*'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.pink),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Mike smith*'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 22),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.pink),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Mike smith*'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.pink),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Mike smith*'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  border: Border.all(
                                      width: 1, color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: Text(
                                      'Add More',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
