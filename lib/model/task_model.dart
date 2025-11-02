
import 'package:intro_to_bloc/model/todo_model.dart';

class TasksModel {
    String name;
    String id;
    List<TodoModel> todo;

    TasksModel({
        required this.name,
        required this.id,
        required this.todo,
    });

    TasksModel copyWith({
        String? name,
        String? id,
        List<TodoModel>? todo,
    }) => 
        TasksModel(
            name: name ?? this.name,
            id: id ?? this.id,
            todo: todo ?? this.todo,
        );

    factory TasksModel.fromMap(Map<String, dynamic> json) => TasksModel(
        name: json["name"],
        id: json["id"],
        todo: List<TodoModel>.from(json["todo"].map((x) => TodoModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
        "todo": List<dynamic>.from(todo.map((x) => x.toMap())),
    };
}
