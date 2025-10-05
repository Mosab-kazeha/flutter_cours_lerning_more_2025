import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ColumnScreen());
  }
}

class TestColumn extends StatelessWidget {
  const TestColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Container(width: 100, height: 100, color: Colors.teal),
            Container(
              color: Colors.amberAccent,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.backspace_sharp,
                size: 50,
                color: Colors.white,
                shadows: [Shadow()],
              ),
            ),
            Container(width: 200, height: 100, color: Colors.amber),

            Container(width: 300, height: 100, color: Colors.amber),
            Align(
              alignment: Alignment.topLeft,
              child: Container(width: 50, height: 100, color: Colors.amber),
            ),
            Row(
              // spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Container(
                  width: 13,
                  height: 13,
                  // margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                // SizedBox(width: 10),
                Container(
                  width: 13,
                  height: 13,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                // SizedBox(width: 10),
                Container(
                  width: 13,
                  height: 13,
                  // margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Container(width: 100, height: 100, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 115,
              right: 115,
              bottom: 64,
            ),
            child: Text("hello Word"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 21, left: 21, bottom: 36),
            child: Container(
              width: 200,
              height: 100,
              color: Color.fromRGBO(166, 166, 166, 1),
            ),
          ),
          Text(
            "Access Anywhere",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(38, 38, 38, 1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "The video call feature can be\n accessed from anywhere in your\n house to help you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(166, 166, 166, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 104, right: 84, left: 84),
            child: Container(
              width: 200,
              height: 100,
              color: Color.fromRGBO(166, 166, 166, 1),
            ),
          ),
        ],
      ),
    );
  }
}
