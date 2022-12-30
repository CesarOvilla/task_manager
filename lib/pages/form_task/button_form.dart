import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/widgets/elevatedbutton_custom.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ElevatedButtonCustom(
        function: () {},
        text: 'Save',
        primaryColor: Colors.blueAccent,
        height: 40,
        width: Get.width * 0.5,
      ),
    );
  }
}
