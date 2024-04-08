import 'package:flutter/material.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, bottom: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          child:
                              Image.asset('assets/images/Rectangle 5042.png'),
                        ),
                        Positioned(
                          left: 155,
                          top: 8,
                          child: Container(
                            child: Image.asset('assets/images/Group 10988.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Image.asset('assets/images/Rectangle 503.png'),
                      ),
                      Positioned(
                        left: 145,
                        top: 8,
                        child: Container(
                          child: Image.asset('assets/images/Group 10988.png'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 1, color: Colors.pinkAccent),
                    ),
                    hintText: "Caption"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(241, 239, 239, 1)),
                  top: BorderSide(
                      width: 1, color: Color.fromRGBO(241, 239, 239, 1)),
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/location.png'),
                  Text(
                    'Add Location',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 13, top: 10, bottom: 15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(241, 239, 239, 1)))),
                child: Row(
                  children: [
                    Image.asset('assets/images/tag.png'),
                    Text(
                      'Tag Friends',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
