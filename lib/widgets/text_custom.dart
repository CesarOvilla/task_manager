import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
    this.text, {
    Key? key,
    this.colorFont,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Color? colorFont;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colorFont,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
