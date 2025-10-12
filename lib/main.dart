import 'dart:io';

import 'package:flutter/material.dart';

import 'column_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ItemPage());
  }
}

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Column(
          children: [
            Text("data"),
            Container(
              color: Colors.amber,
              child: Column(children: [Text("data")]),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  ItemPage({super.key});

  List<String> name = ['mhd', 'omar', 'zied', 'rame', "abd"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("title"),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                print(index);
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(name[index]),
                  subtitle: Text("massage"),
                  trailing: Icon(Icons.check_sharp),
                );
                // return Container(
                //   width: double.infinity,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.teal,
                //   ),
                //   margin: EdgeInsets.all(10),
                //   alignment: Alignment(0, 0),
                //   child: Row(
                //     spacing: 30,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: 50,
                //         height: 50,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.white,
                //         ),
                //       ),
                //       Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [Text("Name"), Text("massage")],
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ),
          Container(
            width: 300,
            height: 50,
            color: Colors.blue,
            child: Text("get started"),
          ),
        ],
      ),
    );
  }
}
