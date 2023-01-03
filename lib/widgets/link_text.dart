import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/utils/color_app.dart';

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
        style: GoogleFonts.nunito(
          color: colorText ?? ColorApp.linktext,
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
