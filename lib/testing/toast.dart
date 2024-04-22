import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: Toast(),
  ));
}

class Toast extends StatefulWidget {
  const Toast({super.key});

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  void showToast() {
    Fluttertoast.showToast(msg: "user already selected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
          onPressed: showToast, child: Text('click to show toast message')),
    );
  }
}
