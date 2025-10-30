// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String name;
  String id;
  String taskId;
  bool is_done;
  TaskModel({
    required this.name,
    required this.id,
    required this.taskId,
    required this.is_done,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'taskId': taskId,
      'is_done': is_done,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      name: map['name'] as String,
      id: map['id'] as String,
      taskId: map['taskId'] as String,
      is_done: map['is_done'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(name: $name, id: $id, taskId: $taskId, is_done: $is_done)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id &&
      other.taskId == taskId &&
      other.is_done == is_done;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      taskId.hashCode ^
      is_done.hashCode;
  }
}
