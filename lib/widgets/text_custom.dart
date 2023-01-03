import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/utils/color_app.dart';

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
      style: GoogleFonts.nunito(
        color: colorFont ?? ColorApp.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize,
      ),
    );
  }
}
