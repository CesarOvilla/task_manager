import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/service/sharedpreference/shared_preference_servcie.dart';

class TaskService extends GetConnect {
  final String _url =
      'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks';

  final Map<String, String> _headers = {
    'Authorization': SharedPreferencesService.authorization!,
  };

  final Map<String, String> queryP = {
    'token': SharedPreferencesService.tokenUser!
  };

  Future<List<TaskModel>> getTask() async {
    Response response = await get(_url,
        headers: _headers,
        contentType: 'application/x-www-form-urlencoded',
        query: queryP);
    return response.status.code == 200 ? listToObject(response.body) : [];
  }

  Future<TaskModel?> getTaskByid({required int id}) async {
    Response response = await get(
      '$_url/$id',
      headers: _headers,
      contentType: 'application/x-www-form-urlencoded',
      query: queryP,
    );
    return response.status.code == 200
        ? TaskModel.fromJson(response.body[0])
        : null;
  }

  Future<TaskModel?> postTask({required TaskModel task}) async {
    String encodedBody = encode(body: task.toJson());

    Response response = await post(
      _url,
      encodedBody,
      headers: _headers,
      contentType: 'application/x-www-form-urlencoded',
    );
    return response.status.code == 201
        ? TaskModel.fromJson(response.body['task'])
        : null;
  }

  Future<bool> deleteTask({required int id}) async {
    Response response = await delete(
      '$_url/$id',
      headers: _headers,
      contentType: 'application/x-www-form-urlencoded',
      query: queryP,
    );
    return response.status.code == 201 ? true : false;
  }

  Future<TaskModel?> putTask({required TaskModel task, required int id}) async {
    String encodedBody = encode(body: task.toJson());
    Response response = await put(
      '$_url/$id',
      encodedBody,
      headers: _headers,
      contentType: 'application/x-www-form-urlencoded',
      query: queryP,
    );
    return response.status.code == 201
        ? TaskModel.fromJson(response.body['task'])
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
        .join("&");
  }
}
