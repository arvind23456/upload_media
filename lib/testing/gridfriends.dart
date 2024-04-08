// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mango/flow2/search_for_friends.dart';

void main() {
  runApp(const MaterialApp(
    home: GridFriends(),
  ));
}

class GridFriends extends StatefulWidget {
  const GridFriends({super.key});

  @override
  State<GridFriends> createState() => _GridFriendsState();
}

class _GridFriendsState extends State<GridFriends> {
  List<String> items = [
    'Mike',
    'Shane',
    'Arvind singh',
    'Frank',
    'Lakha Gaming',
    'German singh',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index == items.length - 1) {
            return ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Searchforfriends(),
                      ));
                },
                child: Text(
                  'Addmore',
                  style: TextStyle(color: Colors.white70),
                ));
          }
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.pink),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 7),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              "${items[index]}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            child: Image.asset(
                              'assets/images/cross.png',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Icon(Icons.report)
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 30,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      )),
    );
  }
}



//   if (index > 0) Text("${items[index]}"),