// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
/*
import 'package:flutter/material.dart';
import 'package:mango/utils/icons.dart';
import 'package:mango/utils/textcolor.dart';

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
                  child: Logoicon.categorymenu,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    dropdownColor: Color.fromRGBO(250, 250, 250, 1),
                    value: dropdownValue,
                    hint: Text(
                      'Category',
                      style: Textcolor.fontsizecolor,
                    ),
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


*/

import 'package:flutter/material.dart';
import 'package:mango/utils/icons.dart';

List<String> list = [
  'Books',
  'Gaming',
  'Sports Wear',
  'Gold',
  'Singing',
  'Dancing',
  'Badminton',
  'Chess',
];

List<String> filterlist = [];

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool showCategoryList = false;

  String? selectedCategory;

  TextEditingController _controller = TextEditingController();

  void searchFilter(String value) {
    setState(() {
      filterlist = list
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          showCategoryList = true;
        } else {
          showCategoryList = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        color: Color.fromRGBO(250, 250, 250, 1),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, left: 7, top: 18),
                  child: Container(
                    width: 30,
                    child: Logoicon.categorymenu,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      height: 35,
                      color: Color.fromRGBO(250, 250, 250, 1),
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          searchFilter(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Category',
                          contentPadding: EdgeInsets.only(bottom: 12),
                          suffixIcon: _controller.text.isNotEmpty
                              ? IconButton(
                                  icon: Logoicon.textremoval,
                                  onPressed: () {
                                    _controller.clear();
                                  },
                                )
                              : null,
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(130, 127, 127, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showCategoryList && selectedCategory != null)
              Container(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Color.fromRGBO(241, 239, 239, 1),
                          height: 0,
                        ),
                    shrinkWrap: true,
                    itemCount: filterlist.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filterlist[index],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          selectedCategory = null;
                          _controller.text = filterlist[index];
                          showCategoryList = false;
                          selectedCategory = filterlist[index];
                        },
                      );
                    }),
              ),
          ],
        ),
      ),
    );
  }
}





/*   Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Divider(
                        color: Color.fromRGBO(241, 239, 239, 1),
                        height: 0,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ...((filterlist.isNotEmpty
                                  ? filterlist
                                  : filterlist1))
                              .asMap()
                              .entries
                              .map(
                                (entry) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(entry.value),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue = entry.value;
                                          _controller.text = dropdownValue!;
                                          showCategoryList = false;
                                        });
                                      },
                                    ),
                                    if (entry.key !=
                                        (filterlist.isNotEmpty
                                            ? filterlist.length - 1
                                            : list.length - 1))
                                      Divider(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        height: 0,
                                      ),
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),  

              */





              /*
               Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterlist.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filterlist[index],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          print(filterlist[index]);
                          _controller.text = filterlist[index];
                          showCategoryList = false;
                        },
                      );
                    }),
              ),*/