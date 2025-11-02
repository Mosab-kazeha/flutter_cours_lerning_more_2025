class TodoModel {
  bool isDone;
  String name;

  TodoModel({required this.isDone, required this.name});

  TodoModel copyWith({
    bool? isDone,
    String? name,
    String? id,
    String? taskId,
  }) => TodoModel(isDone: isDone ?? this.isDone, name: name ?? this.name);

  factory TodoModel.fromMap(Map<String, dynamic> json) =>
      TodoModel(isDone: json["is_done"], name: json["name"]);

  Map<String, dynamic> toMap() => {"is_done": isDone, "name": name};
}
