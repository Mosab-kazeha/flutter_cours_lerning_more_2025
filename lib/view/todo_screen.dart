import 'package:flutter/material.dart';
import 'package:intro_to_bloc/model/todo_model.dart';
import 'package:intro_to_bloc/service/todo_service.dart';

class TodoScreen extends StatefulWidget {
  final List<TodoModel>? todo;
  final String id;
  const TodoScreen({super.key, required this.todo, required this.id});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: widget.todo!.length,
                itemBuilder:
                    (context, index) => ListTile(
                      onTap: () {},
                      title: Text("${widget.todo?[index].name}"),
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                TodoModel todoModel = TodoModel(
                  isDone: false,
                  name: "new code",
                );
                setState(() {});
                widget.todo!.add(todoModel);
                TodoService().createNewTodo(todoModel, widget.id);
              },
              child: Container(
                width: 300,
                height: 200,
                color: Colors.white,
                child: Center(child: Text('add new todo')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
