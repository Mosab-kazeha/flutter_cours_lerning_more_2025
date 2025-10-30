import 'package:dio/dio.dart';
import 'package:todo_app/model/task_model.dart';

class TaskService {
  Dio dio = Dio();
  String baseurl = "https://67487a005801f515359111f2.mockapi.io/task/1/todo/";
  late Response response;

  Future<TaskModel> getOneTask() async {
    response = await dio.get("${baseurl}1");
    print(response.data);
    return TaskModel.fromMap(response.data);
  }

  Future<List<TaskModel>> getAllTasks() async {
    response = await dio.get(baseurl);
    print(response.data);
    List<TaskModel> tasks = [];
    for (var i = 0; i < response.data.length; i++) {
      tasks.add(TaskModel.fromMap(response.data[i]));
    }
    return tasks;
  }

  Future<bool> changeISDone(String id) {
    // TODO : create method PUT to change the status of Task
    throw Exception();
  }

  Future<bool> deleteThisTask(String id) {
    // TODO : create method DELETE to delete the task
    throw Exception();
  }
}
