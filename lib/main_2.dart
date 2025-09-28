import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(9, 10, 13, 0.03),
        body: Center(
          child: Container(
            height: 200,
            width: 200,

            child: FlutterLogo(),
            color: Color.fromRGBO(97, 3, 249, 0.494),
          ),
        ),
      ),
    );
  }
}
