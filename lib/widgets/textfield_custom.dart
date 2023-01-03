import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/color_app.dart';
import 'package:task_manager/widgets/text_custom.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    this.controller,
    this.hintStyle,
    this.labelText,
    this.icon,
    this.height,
    this.width,
    this.maxLine,
    this.validate = false,
    required this.hintText,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final IconData? icon;
  final int? maxLine;
  final bool validate;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var styleBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:  BorderSide(color: ColorApp.borderTextfield),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextCustom(
              labelText!,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: height ?? 60,
            width: width ?? Get.width,
            child: TextFormField(
              maxLines: maxLine,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: styleBorder,
                focusedBorder: styleBorder,
                prefixIcon: icon != null
                    ? Icon(
                        icon,
                        size: 24,
                        color: ColorApp.iconTextfield,
                      )
                    : null,
                hintText: hintText, // pass the hint text parameter here
                hintStyle:
                    hintStyle ??  TextStyle(color: ColorApp.hinttextTextfield),
                errorBorder: styleBorder.copyWith(
                  borderSide:  BorderSide(
                    color: ColorApp.errorTextfield,
                  ),
                ),
              ),
              validator: validate ? validator : null,
            ),
          ),
        ],
      ),
    );
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return "LLene este campo";
    }
    return null;
  }
}
