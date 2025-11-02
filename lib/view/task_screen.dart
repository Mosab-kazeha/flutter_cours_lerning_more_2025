import 'package:flutter/material.dart';
import 'package:intro_to_bloc/service/task_service.dart';
import 'package:intro_to_bloc/view/todo_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: TaskService().getAllTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:
                    (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TodoScreen(
                                  todo: snapshot.data![index].todo,
                                  id: snapshot.data![index].id,
                                ),
                          ),
                        );
                      },
                      title: Text("${snapshot.data?[index].name}"),
                    ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
