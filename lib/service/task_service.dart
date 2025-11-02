import 'package:dio/dio.dart';
import 'package:intro_to_bloc/model/task_model.dart';

class TaskService {
  Dio dio = Dio();
  late Response response;

  Future<List<TasksModel>> getAllTasks() async {
    response = await dio.get(
      'https://67487a005801f515359111f2.mockapi.io/task',
    );

    List<TasksModel> tasks = List.generate(
      response.data.length,
      (index) => TasksModel.fromMap(response.data[index]),
    );

    return tasks;
  }
}
