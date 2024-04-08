import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Friendtest(),
  ));
}

class Friendtest extends StatefulWidget {
  const Friendtest({super.key});

  @override
  State<Friendtest> createState() => _FriendtestState();
}

class _FriendtestState extends State<Friendtest> {
  List<String> Friendss = ['Arvind', 'Lakha', 'singh', 'Amit'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: Friendss.length + 1,
          itemBuilder: (context, index) {
            if (index == Friendss.length - 2)
              return TextButton(
                onPressed: () {},
                child: Text('Add 1me'),
              );
            return Container(
              child: Text(Friendss[index]),
            );
          },
        ),
      ),
    );
  }
}
