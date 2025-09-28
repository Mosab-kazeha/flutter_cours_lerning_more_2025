import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.teal,
            child: Center(
              child: Text(
                "hello World",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  // backgroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: FlutterLogo(),
        floatingActionButton: Text("Hello form FAB"),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}
