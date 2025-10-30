import 'package:flutter/material.dart';
import 'package:todo_app/service/task_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TasksPage());
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: TaskService().getOneTask(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: FutureBuilder(
          future: TaskService().getAllTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    TaskService().changeISDone(snapshot.data![index].id);
                  },
                  onDoubleTap: () {
                    TaskService().deleteThisTask(snapshot.data![index].id);
                  },

                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: snapshot.data![index].is_done
                          ? Colors.white
                          : Colors.green,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      snapshot.data![index].name,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
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
