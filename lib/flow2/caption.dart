import 'package:flutter/material.dart';
import 'package:mango/utils/textcolor.dart';

class Caption extends StatefulWidget {
  const Caption({super.key});

  @override
  State<Caption> createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 6),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        ))),
        child: const TextField(
          maxLines: null,
          minLines: 6,
          style: TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(241, 239, 239, 1))),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(241, 239, 239, 1))),
            hintText: "Caption",
            hintStyle: Textcolor.fontsizecolor,
          ),
        ),
      ),
    );
  }
}
