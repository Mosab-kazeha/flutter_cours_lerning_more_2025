import 'package:dio/dio.dart';
import 'package:intro_to_bloc/model/todo_model.dart';

class TodoService {
  Dio dio = Dio();
  late Response response;

  Future<bool> createNewTodo(TodoModel todo, String id) async {
    response = await dio.post(
      'https://67487a005801f515359111f2.mockapi.io/task/$id/todo',
      data: todo.toMap(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
