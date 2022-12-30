import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/principal/body_principal.dart';
import 'package:task_manager/provider/principal_provider.dart';
import 'package:task_manager/service/task_service.dart';
import 'package:task_manager/widgets/appbar_custom.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  void initState() {
    Get.put(PrincipalProvider());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<PrincipalProvider>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TaskService service = TaskService();
    service.getTask();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: const AppBarCustom(
        title: "Task Manager",
      ),
      body: const BodyPrincipal(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed("/formTask");
        },
      ),
    );
  }
}
