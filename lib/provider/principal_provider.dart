

import 'package:get/get.dart';
import 'package:task_manager/model/task_basic_model.dart';
import 'package:task_manager/service/task_service.dart';

class PrincipalProvider {

  late TaskService service;
  Rxn<List<TaskBasicModel>?> tasks = Rxn<List<TaskBasicModel>?>();

  PrincipalProvider(){
    service = TaskService();
    _getList();
  }

  void _getList()async{
    tasks.value = await service.getTask();
  }


}