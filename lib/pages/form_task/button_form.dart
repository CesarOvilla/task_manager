import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/provider/form_task_provider.dart';
import 'package:task_manager/widgets/elevatedbutton_custom.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormTaskProvider provider = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ElevatedButtonCustom(
        function: provider.saveRegister,
        text: 'Save',
        primaryColor: Colors.blueAccent,
        height: 40,
        width: Get.width * 0.5,
      ),
    );
  }
}
