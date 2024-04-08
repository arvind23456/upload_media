import 'package:flutter/material.dart';
import 'package:mango/flow2/search_for_friends.dart';

class Tagfriends extends StatefulWidget {
  const Tagfriends({Key? key}) : super(key: key);

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
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            Image.asset('assets/images/tag.png'),
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Column(
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
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  Container(
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.pink,
                                    ),
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
                                            style: TextStyle(fontSize: 20),
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
                      },
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Add some spacing between the GridView and the "Add More" button
                  ElevatedButton(
                    onPressed: () async {
                      final Friend = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Searchforfriends(),
                        ),
                      );
                      setState(() {
                        selectedFriend.add(Friend);
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Add More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
