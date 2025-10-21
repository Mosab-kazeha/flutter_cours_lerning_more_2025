// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String title;
  String name;
  int time_to_done;
  String id;
  TaskModel({
    required this.title,
    required this.name,
    required this.time_to_done,
    required this.id,
  });

  static fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      name: map['name'],
      time_to_done: map['time_to_done'],
      id: map['id'],
    );
  }

 static toMap(TaskModel task) {
    return {
      "title": task.title,
      "name": task.name,
      "time_to_done": task.time_to_done,
      "id": task.id,
    };
  }
}
