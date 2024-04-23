import 'package:flutter/material.dart';
import 'package:mango/utils/icons.dart';
import 'package:mango/utils/textcolor.dart';
import 'package:mango/z2_testing/button_class.dart';

class Addtitle extends StatefulWidget {
  const Addtitle({super.key});

  @override
  State<Addtitle> createState() => _AddtitleState();
}

class _AddtitleState extends State<Addtitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 239, 239, 1),
          ),
          top: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 239, 239, 1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
        child: Row(
          children: [
            Container(
              child: Logoicon.title,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.5),
              child: SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Title',
                      hintStyle: Textcolor.fontsizecolor,
                    ),
                  )),
            ),
            RoundedButton(
              buttonName: 'post',
              callBack: () {},
            ),
          ],
        ),
      ),
    );
  }
}
