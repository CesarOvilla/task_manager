import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';

class TaskService extends GetConnect {
  final String _url =
      'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks';

  final String _authorization =
      'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';

  Future<List<TaskModel>> getTask() async {
    Response response = await get(_url,
        headers: {
          'Authorization': _authorization,
        },
        contentType: 'application/x-www-form-urlencoded',
        query: {'token': 'prueba'});
    return response.status.code == 200 ? listToObject(response.body) : [];
  }

  Future<TaskModel?> getTaskByid({required int id}) async {
    Response response = await get(
      '$_url/$id',
      headers: {
        'Authorization': _authorization,
      },
      contentType: 'application/x-www-form-urlencoded',
      query: {'token': 'prueba'},
    );
    return response.status.code == 200
        ? TaskModel.fromJson(response.body[0])
        : null;
  }

  Future<TaskModel?> postTask(TaskModel task) async {
    String encodedBody = encode(body: task.toJson());

    Response response = await post(
      _url,
      encodedBody,
      headers: {
        'Authorization': _authorization,
      },
      contentType: 'application/x-www-form-urlencoded',
    );
    return response.status.code == 201
        ? TaskModel.fromJson( response.body['task'])
        : null;
  }

  List<TaskModel> listToObject(List<dynamic> object) {
    List<TaskModel> list = [];
    for (var element in object) {
      list.add(TaskModel.fromJson(element));
    }
    return list;
  }

  String encode({required Map<String, dynamic> body}) {
    return body.keys
        .map(
          (key) =>
              body[key] != null && body[key] != '' ? "$key=${body[key]}" : '',
        )
        .join("&")
        .replaceAll("&&", '');
  }
}
