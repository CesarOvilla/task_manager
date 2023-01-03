import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/widgets/text_custom.dart';

class ElevatedButtonCustom extends StatelessWidget {
  // final Size size;
  final String text;
  final Color primaryColor;
  final VoidCallback function;
  final double? width;
  final double? height;

  const ElevatedButtonCustom({
    Key? key,
    // required this.size,
    this.height,
    this.width,
    required this.text,
    required this.primaryColor,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: size.width * 0.3,
      width: width ?? Get.width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: function,
        child: TextCustom(text, fontSize: 18),
      ),
    );
  }
}
