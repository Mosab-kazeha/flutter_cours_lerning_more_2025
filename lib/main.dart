import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CulomnPage());
}

class CulomnPage extends StatelessWidget {
  const CulomnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(width: 200, height: 200, color: Colors.blueGrey),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(10),
                child: Text('hello', style: TextStyle(fontSize: 50)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Text('hello', style: TextStyle(fontSize: 50)),
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.all(10),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: FlutterLogo()),
            Padding(padding: const EdgeInsets.all(10), child: Icon(Icons.face)),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(width: 200, height: 200, color: Colors.amber),
            ),
            // Container(width: 200, height: 200, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}

// class ImagePage extends StatelessWidget {
//   const ImagePage({super.key});

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           // child: Image.network(
//           //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzTojBf4VJCGR4Z-QxG-7GozKDuWjCst6z6Q&s',
//           // ),
//           // child: Image.file(
//           //   File("C:/Users/mosab/Desktop/photo_2025-07-22_07-24-38.jpg"),
//           // ),
//           child: Image.asset('assets/image_wesdom.jpeg'),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(),
          title: Text('title'),
          // toolbarHeight: 500,
          actions: [FlutterLogo(), FlutterLogo()],
        ),
        backgroundColor: Colors.teal,
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Colors.black, Colors.grey, Colors.white],
              //   begin: Alignment.bottomLeft,
              //   end: Alignment.topRight,
              // ),
              // gradient: RadialGradient(
              //   radius: 0.5,
              //   center: Alignment.topCenter,
              //   colors: [Colors.green, Colors.white, Colors.blueGrey],
              // ),
              gradient: SweepGradient(
                // center: Alignment(0.1, 0.1),
                // startAngle: 1,
                endAngle: math.pi * 2,
                colors: [CupertinoColors.activeBlue, Colors.amber],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                  spreadRadius: 10,
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner,
                ),
              ],
              color: Colors.white,
              // shape: BoxShape.circle,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(10),
              //   bottomRight: Radius.circular(20),
              //   topRight: Radius.circular(20),
              // ),
              border: Border.all(
                color: Colors.red.shade900,
                width: 5,
                strokeAlign: BorderSide.strokeAlignInside,
                // style: BorderStyle.none,
              ),
              image: DecorationImage(
                image: AssetImage('assets/image.jpg'),
                opacity: 0.9,
              ),
            ),
            // child: FlutterLogo(size: 66),
            // child: Image.asset("assets/image_wesdom.jpeg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
