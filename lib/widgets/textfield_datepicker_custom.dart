// import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/utils/color_app.dart';
import 'package:task_manager/widgets/text_custom.dart';
// import 'package:intl/intl.dart';

class TextFieldDatePickerCustom extends StatelessWidget {
  const TextFieldDatePickerCustom({
    Key? key,
    this.controller,
    this.hintStyle,
    required this.labelText,
    this.height,
    this.width,
    this.hintText,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? hintText;
  final TextStyle? hintStyle;
  final String labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var styleBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: ColorApp.borderTextfield),
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
              labelText,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: height ?? 60,
            width: width ?? Get.width,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: styleBorder,
                focusedBorder: styleBorder,
                border: const OutlineInputBorder(),

                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: ColorApp.iconTextfield,
                  size: 24,
                ),
                hintText: hintText, // pass the hint text parameter here
                hintStyle: hintStyle ??
                    GoogleFonts.nunito(
                        color: ColorApp.hinttextTextfield, fontSize: 16),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      controller != null ? controller!.text = formattedDate : null;
    }
  }
}
