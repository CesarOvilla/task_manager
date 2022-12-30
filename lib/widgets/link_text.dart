import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key? key,
    required this.text,
    required this.onTap,
    this.colorText,
    this.textSize,
  }) : super(key: key);
  final String text;
  final double? textSize;
  final Function onTap;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: colorText ?? Colors.black,
          fontSize: textSize,
        ),
        text: text,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTap();
          },
      ),
    );
  }
}
