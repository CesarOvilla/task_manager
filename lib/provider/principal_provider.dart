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

  Future<void> addTask({required task}) async {
    TaskModel? taskNew = await service.postTask(task: task);

    if (taskNew != null) {
      tasks.value!.add(taskNew);
      tasks.refresh();
    }
  }

  Future<void> deleteTask({required int id}) async {
    bool response = await service.deleteTask(id: id);
    if (response) {
      tasks.value!.removeWhere(
        (element) => element.id == id,
      );
      tasks.refresh();
    }
  }
}
