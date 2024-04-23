import 'package:flutter/material.dart';
import 'package:mango/utils/icons.dart';

void main() {
  runApp(MaterialApp(home: Categorylistview()));
}

class Categorylistview extends StatefulWidget {
  const Categorylistview({super.key});

  @override
  State<Categorylistview> createState() => _CategorylistviewState();
}

class _CategorylistviewState extends State<Categorylistview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Logoicon.categorymenu,
          TextButton(
              onPressed: () {
                ListView(
                  children: [
                    Text('Books'),
                    Text('Gaming'),
                    Text('Sports Wear'),
                  ],
                );
              },
              child: Text('Category')),
        ],
      ),
    );
  }
}
