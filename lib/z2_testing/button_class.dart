import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  RoundedButton(
      {required this.buttonName,
      this.icon,
      this.bgColor = Colors.amber,
      this.textStyle,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callBack!();
      },
      child: icon != null
          ? Row(
              children: [
                icon!,
                Text(
                  buttonName,
                  style: textStyle,
                ),
              ],
            )
          : Text(
              buttonName,
              style: textStyle,
            ),
      style: ElevatedButton.styleFrom(),
    );
  }
}
