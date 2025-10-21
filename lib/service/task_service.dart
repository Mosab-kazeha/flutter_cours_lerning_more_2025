import 'package:dio/dio.dart';
import 'package:intro_to_statefull/model/task_model.dart';

class TaskService {
  Dio dio = Dio();
  String url = "https://67487a005801f515359111f2.mockapi.io/task";
  late Response response;

  getOneTask() async {
    response = await dio.get("$url/1");
    TaskModel tempResponce = TaskModel.fromMap(response.data);

    return tempResponce;
  }

  getAllTask() async {
    response = await dio.get(
      "https://67487a005801f515359111f2.mockapi.io/task",
    );
    //*=================================
    //List<TaskModel> tempResponce =  List.generate(
    //   response.data.length,
    //   (index) => TaskModel.fromMap(response.data[index]),
    // );
    //*===================================
    List<TaskModel> tempResponce = [];
    for (var i = 0; i < response.data.length; i++) {
      tempResponce.add(TaskModel.fromMap(response.data[i]));
    }
    //*==================================
    return tempResponce;
  }

  crateTask(TaskModel task) async {
    response = await dio.post(url, data: TaskModel.toMap(task));
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  changeTheTask({required TaskModel newTask, required String id}) async {
    response = await dio.put('$url/$id', data: TaskModel.toMap(newTask));
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  deletTheTask({required String id}) async {
    response = await dio.delete("$url/$id");
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
