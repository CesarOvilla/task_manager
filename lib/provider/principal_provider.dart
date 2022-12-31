import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/service/task_service.dart';

class PrincipalProvider extends GetxController {
  late TaskService service;
  Rxn<List<TaskModel>?> tasks = Rxn<List<TaskModel>?>();

  PrincipalProvider() {
    service = TaskService();
    _getList();
  }

  void _getList() async {
    tasks.value = await service.getTask();
  }
}
