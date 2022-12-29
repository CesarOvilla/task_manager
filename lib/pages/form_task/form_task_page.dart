import 'package:flutter/material.dart';
import 'package:task_manager/widgets/appbar_custom.dart';

class FormTaskPage extends StatelessWidget {
  const FormTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: "Create Task",
        back: true,
      ),
      body: Column(),
    );
  }
}
