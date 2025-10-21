import 'package:flutter/material.dart';
import 'package:intro_to_statefull/model/task_model.dart';
import 'package:intro_to_statefull/service/task_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskPageWithFutuerBuilderToGetAllTask());
  }
}

class TaskPageWithOutFutuerBuilder extends StatefulWidget {
  const TaskPageWithOutFutuerBuilder({super.key});

  @override
  State<TaskPageWithOutFutuerBuilder> createState() => _HomePageState();
}

class _HomePageState extends State<TaskPageWithOutFutuerBuilder> {
  TaskModel? tempData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            tempData = await TaskService().getOneTask();
            // print(tempData);
            setState(() {});
          },
          child: Text(
            tempData == null ? "there is no data yet" : tempData!.title,
          ),
        ),
      ),
    );
  }
}

class TaskPageWithFutuerBuilderToGetOneTask extends StatelessWidget {
  const TaskPageWithFutuerBuilderToGetOneTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TaskService().getOneTask(),
        builder: (context, snapshot) {
          print(snapshot);
          print(000000000000000);
          if (snapshot.hasData) {
            TaskModel task = ((snapshot.data) as TaskModel);
            return Center(
              child: ListTile(
                leading: CircleAvatar(child: Text(task.id)),
                title: Text(task.title),
                subtitle: Text(task.name),
                trailing: Text(task.time_to_done.toString()),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class TaskPageWithFutuerBuilderToGetAllTask extends StatelessWidget {
  TaskPageWithFutuerBuilderToGetAllTask({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (context) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        bool isCreated = await TaskService().crateTask(
                          TaskModel(
                            title: "flutter",
                            name: controller.text,
                            time_to_done: 5,
                            id: "0",
                          ),
                        );

                        if (isCreated) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('the task created successfuly'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        if (!isCreated) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('field with create the task'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                        controller.text.isNotEmpty
                            ? Navigator.pop(context)
                            : print("object");
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        color: Colors.teal,
                        child: Center(child: Text("Create task")),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      body: FutureBuilder(
        future: TaskService().getAllTask(),
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.hasData) {
            List<TaskModel> task = ((snapshot.data) as List<TaskModel>);
            if (task.isEmpty) {
              return Center(child: Text("there is no data "));
            }
            return ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    TaskService().deletTheTask(id: task[index].id);
                  },
                  onTap: () {
                    TaskService().changeTheTask(
                      newTask: TaskModel(
                        title: 'title',
                        name: 'name',
                        time_to_done: 5,
                        id: 'id',
                      ),
                      id: task[index].id,
                    );
                  },
                  leading: CircleAvatar(child: Text(task[index].id)),
                  title: Text(task[index].title),
                  subtitle: Text(task[index].name),
                  trailing: Text(task[index].time_to_done.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
