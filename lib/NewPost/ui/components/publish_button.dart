import 'package:flutter/material.dart';
import 'package:prueba/constants.dart';

class PublishButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool bold;
  final bool expanded;
  const PublishButton({
    Key? key,
    this.bold = false,
    this.expanded = true,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: expanded ? double.infinity : null,
        height: 32,
        child: TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: kBrightPurpleColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              )),
          onPressed: press,
          child: Text(text,
              style: TextStyle(
                fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
                fontSize: 11.0,
              )),
        ));
  }
}
