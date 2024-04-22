import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mango/video_flow/search_for_friends.dart';

import 'package:mango/utils/icons.dart';
import 'package:mango/utils/textcolor.dart';

class Tagfriends extends StatefulWidget {
  const Tagfriends({super.key});

  @override
  State<Tagfriends> createState() => _TagfriendsState();
}

class _TagfriendsState extends State<Tagfriends> {
  List<String> selectedFriend = [];

  void showToast() {
    Fluttertoast.showToast(
        msg: "User already selected", backgroundColor: Colors.black54);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Logoicon.tag,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedFriend.isEmpty)
                  TextButton(
                    onPressed: () async {
                      final friend = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Searchforfriends(),
                          ));

                      setState(() {
                        //  if (selectedFriend.contains(friend) == false)
                        {
                          selectedFriend.add(friend);
                        }
                      });
                      print(selectedFriend);
                    },
                    child: Container(
                      child: const Text(
                        'Tag Friends',
                        style: Textcolor.fontsizecolor,
                      ),
                    ),
                  ),
                if (selectedFriend.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Container(
                      width: 320,
                      child: GridView.builder(
                        itemCount: selectedFriend.length + 1,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 37,
                          childAspectRatio: 20,
                        ),
                        itemBuilder: (context, index) {
                          if (index == selectedFriend.length) {
                            return Container(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(left: 7)),
                                onPressed: () async {
                                  final friend = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Searchforfriends(),
                                    ),
                                  );
                                  if (!selectedFriend.contains(friend)) {
                                    setState(() {
                                      selectedFriend.add(friend);
                                    });
                                  } else {
                                    showToast();
                                  }
                                },
                                child: Container(
                                  height: 27,
                                  width: 98,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Add more ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 14),
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
                                            child: Logoicon.cross,
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
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  



/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/flow2/category_list.dart';
import 'package:mango/flow2/search_for_friends.dart';
import 'package:mango/ui/mfriends.dart';
import 'package:mango/utils/icons.dart';
import 'package:mango/utils/textcolor.dart';

class Tagfriends extends StatefulWidget {
  const Tagfriends({Key? key}) : super(key: key);

  @override
  State<Tagfriends> createState() => _TagfriendsState();
}

class _TagfriendsState extends State<Tagfriends> {
  Set<String> selectedFriend = {}; // Changed to Set

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 239, 239, 1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Logoicon.tag,
            ),
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
                        ),
                      );

                      setState(() {
                        selectedFriend.add(friend);
                      });
                      print(selectedFriend);
                    },
                    child: Container(
                      child: Text(
                        'Tag Friends',
                        style: Textcolor.fontsizecolor,
                      ),
                    ),
                  ),
                if (selectedFriend.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Container(
                      width: 320,
                      child: GridView.builder(
                        itemCount: selectedFriend.length + 1,
                        shrinkWrap: true,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 37,
                          childAspectRatio: 20,
                        ),
                        itemBuilder: (context, index) {
                          if (index == selectedFriend.length) {
                            return Container(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.only(left: 7)),
                                onPressed: () async {
                                  final Friend = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Searchforfriends(),
                                    ),
                                  );
                                  setState(() {
                                    selectedFriend.add(Friend);
                                  });
                                },
                                child: Container(
                                  height: 27,
                                  width: 98,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Add more ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                                  selectedFriend
                                                      .elementAt(index), // Updated to use elementAt
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 14),
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
                                            child: Logoicon.cross,
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
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


*/