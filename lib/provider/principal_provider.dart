import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/service/task_service.dart';

class PrincipalProvider extends GetxController {
  late TaskService service;
  Rxn<List<TaskModel>?> tasks = Rxn<List<TaskModel>?>();
Rxn<TaskModel?> task = Rxn<TaskModel?>();

  PrincipalProvider() {
    service = TaskService();
    _getList();
  }

  void _getList() async {
    tasks.value = await service.getTask();
  }

  Future<TaskModel?> getTaskId({required int id}) async {
   return await service.getTaskByid(id: id);
  }
}
