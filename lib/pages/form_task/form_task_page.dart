import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/form_task/body_form.dart';
import 'package:task_manager/pages/form_task/button_form.dart';
import 'package:task_manager/provider/form_task_provider.dart';
import 'package:task_manager/widgets/appbar_custom.dart';

class FormTaskPage extends StatefulWidget {
  const FormTaskPage({Key? key}) : super(key: key);

  @override
  State<FormTaskPage> createState() => _FormTaskPageState();
}

class _FormTaskPageState extends State<FormTaskPage> {
  @override
  void initState() {
    Get.put(FormTaskProvider());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<FormTaskProvider>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: "Create Task",
        back: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            BodyForm(),
            ButtonForm(),
          ],
        ),
      ),
    );
  }
}
