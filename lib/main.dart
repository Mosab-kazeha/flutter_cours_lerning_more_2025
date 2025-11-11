import 'package:flutter/material.dart';

import 'animaton/animation_screeen.dart';
import 'view/labtop_screen.dart';
import 'view/mobile_screen.dart';
import 'view/tap_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ExplicitAinmationScreen());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.amber,
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  "width ${size.width}\n height ${size.height}",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: size.width / 2,
                    height: size.height / 2,
                    color: Colors.teal,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: size.width / 2,
                    height: size.height / 2,
                    color: Colors.brown,
                  ),
                ),
                MediaQuery.of(context).orientation.name == "portrait"
                    ? Row(
                        children: [
                          Text(MediaQuery.of(context).orientation.name),
                          Spacer(flex: 6),
                          Text("data"),
                          Spacer(flex: 1),
                        ],
                      )
                    : Icon(Icons.person),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: size.width / 2,
                    height: size.height / 2,
                    color: Colors.blueGrey,
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
                    width: size.width / 2,
                    height: size.height / 2,
                    color: Colors.teal,
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Icon(Icons.other_houses));
          }
        },
      ),
    );
  }
}

class AdabtiveScreen extends StatelessWidget {
  const AdabtiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 400) {
            return MobileScreen();
          } else if (constraints.maxWidth < 750) {
            return TabScreen();
          } else {
            return LabtopScreen();
          }
        },
      ),
    );
  }
}
