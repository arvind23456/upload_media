import 'package:flutter/material.dart';
import 'package:mango/flow2/search_for_friends.dart';
import 'package:mango/ui/mfriends.dart';

class Tagfriends1 extends StatefulWidget {
  const Tagfriends1({super.key});

  @override
  State<Tagfriends1> createState() => _Tagfriends1State();
}

class _Tagfriends1State extends State<Tagfriends1> {
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
            Image.asset('assets/images/tag.png'),
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Friends(),
                      ));
                },
                child: Container(
                  child: Text(
                    'Tag Friends',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
