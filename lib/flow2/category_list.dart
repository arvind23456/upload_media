// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

List<String> list = <String>['Books ', ' Gaming', 'Sports Wear ', 'Gold'];

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(241, 239, 239, 1),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 10),
              child: Row(children: [
                Container(
                  child: Image.asset('assets/images/menu (1) 1.png'),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    value: dropdownValue,
                    hint: Text('Category'),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromRGBO(250, 250, 250, 1),
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownValue = newvalue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'one',
                        child: Text(' Books'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'two',
                        child: Text('Gaming'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'three',
                        child: Text('Sports Wear'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'four',
                        child: Text('Gold'),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}  








   
/*
 import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: (Category()),
  ));
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    var arrList = ['Books', 'Gaming', 'Sports Wear', ' Gold'];
    bool showCategoryList = false;
    return Scaffold(
      appBar: AppBar(title: Icon(Icons.arrow_back)),
      body: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Container(
                  child: Image.asset('assets/images/menu (1) 1.png'),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    print('list of category');
                    setState(() {
                      showCategoryList = !showCategoryList;
                    });
                  },
                  child: Text(
                    'Category',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          if (showCategoryList)
            ListView.builder(
              itemCount: arrList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${arrList[index]}"),
                );
              },
            ),
        ],
      ),
    );
  }
} */
 
   
                    
                  