// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/flow2/category_list.dart';
import 'package:mango/flow2/search_for_friends.dart';
import 'package:mango/ui/mfriends.dart';
import 'package:mango/utils/icons.dart';

class Tagfriends extends StatefulWidget {
  const Tagfriends({super.key});

  @override
  State<Tagfriends> createState() => _TagfriendsState();
}

class _TagfriendsState extends State<Tagfriends> {
  List<String> selectedFriend = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            Logoicon.tag,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedFriend.isEmpty)
                  TextButton(
                    onPressed: () async {
                      final friend = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchforfriends(),
                          ));

                      setState(() {
                        selectedFriend.add(friend);
                      });
                      print(selectedFriend);
                    },
                    child: Container(
                      child: Text(
                        'Tag Friends',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                if (selectedFriend.isNotEmpty)
                  Container(
                    width: 320,
                    child: GridView.builder(
                      itemCount: selectedFriend.length + 1,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 37,
                        childAspectRatio: 20,
                      ),
                      itemBuilder: (context, index) {
                        if (index == selectedFriend.length) {
                          return TextButton(
                            onPressed: () async {
                              final Friend = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Searchforfriends(),
                                  ));
                              setState(() {
                                selectedFriend.add(Friend);
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 92,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add more',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    border: Border.all(
                                        width: 1, color: Colors.pink),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 92,
                                            height: 26,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                selectedFriend[index],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedFriend.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            child: Logoicon.cross,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                /*        Container(
                  width: 350,
                  child: GridView.builder(
                      itemCount: selectedFriend.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 50,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        if (index == selectedFriend.length) {
                          return TextButton(
                            onPressed: () async {
                              final Friend = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Searchforfriends(),
                                  ));
                              setState(() {
                                selectedFriend.add(Friend);
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Add More',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
            
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Colors.pink),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 7),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            selectedFriend[index],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedFriend.removeAt(index);
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
                            ],
                          ),
                        );
                      }),
                ), */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
