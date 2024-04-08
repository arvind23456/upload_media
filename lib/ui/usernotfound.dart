// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(Found());
}

class Found extends StatelessWidget {
  const Found({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search for Friends'),
          leading: Icon(Icons.arrow_back),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(248, 248, 251, 1),
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  hintText: 'swa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                child: Text(
                  'User Not Found',
                  style: TextStyle(fontSize: 27),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
