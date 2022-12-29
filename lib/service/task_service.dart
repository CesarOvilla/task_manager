import 'package:get/get.dart';
import 'package:task_manager/model/task_basic_model.dart';

class TaskService extends GetConnect {
  final String _url =
      'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks';

  final String _authorization =
      'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';

  Future<List<TaskBasicModel>> getTask() async {
    Response response = await get(
      _url,
      headers: {
        'Authorization': _authorization,
      },
    );
    return response.status.code == 200 ? listToObject(response.body) : [];
  }

  List<TaskBasicModel> listToObject(List<dynamic> object) {
    List<TaskBasicModel> list = [];
    for (var element in object) {
      list.add(TaskBasicModel.fromJson(element));
    }
    return list;
  }
}
