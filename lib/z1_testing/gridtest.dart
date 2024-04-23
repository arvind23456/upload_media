// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
            shape: Border.all(
                width: 1, color: Color.fromRGBO(235, 232, 255, 0.75)),
            title: Text('Create Post'),
            leading: Icon(Icons.arrow_back),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18, top: 1),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
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
              child: Column(children: [
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
                            width: 177,
                            height: 234,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color.fromRGBO(87, 89, 96, 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 75, top: 90),
                            child: Container(
                              child: Image.asset(
                                'assets/images/Vector.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 120, left: 50),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(87, 89, 96, 1),
                        ),
                        top: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(87, 89, 96, 1),
                        )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17, bottom: 17),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('assets/images/location.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Container(
                            child: Text('New Orieans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Image.asset('assets/images/tag.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.pink),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: GridView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisExtent: 50,
                        ),
                        itemBuilder: (context, index) {
                          return Text('Mike smith');
                        },
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
