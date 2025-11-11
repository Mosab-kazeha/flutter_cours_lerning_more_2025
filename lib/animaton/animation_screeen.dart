import 'dart:ffi';

import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double size = 200;

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("builtIn Animation")),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // setState(() {});
                size = size + 20;
                opacity = 0.5;
              },
              child: AnimatedOpacity(
                opacity: opacity,
                duration: Duration(seconds: 3),
                child: AnimatedContainer(
                  color: Colors.blueGrey,
                  width: size,
                  height: size,
                  duration: Duration(seconds: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TweenAnimationScreen extends StatelessWidget {
  TweenAnimationScreen({super.key});

  Tween<double> border = Tween<double>(begin: 0, end: 100);

  ColorTween color = ColorTween(begin: Colors.teal, end: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: border,
        duration: Duration(seconds: 3),
        builder: (context, value, _) => TweenAnimationBuilder(
          tween: color,
          duration: Duration(seconds: 3),
          builder: (context, val, _) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(value),
              color: val,
            ),
            width: value + 50 * 2,
            height: value + 50 * 2,
          ),
        ),
      ),
    );
  }
}

class ExplicitAinmationScreen extends StatefulWidget {
  const ExplicitAinmationScreen({super.key});

  @override
  State<ExplicitAinmationScreen> createState() =>
      _ExplicitAinmationScreenState();
}

class _ExplicitAinmationScreenState extends State<ExplicitAinmationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> iconSize;
  late Animation<Color?> iconColor;
  late Animation<double> sizeOfIcon;
  late Animation<Color?> colorsOfIcon;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    iconSize = Tween<double>(begin: 50, end: 100).animate(controller);
    iconColor = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(controller);

    sizeOfIcon = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 100), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 100, end: 0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 50), weight: 1),
    ]).animate(controller);

    colorsOfIcon = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.grey, end: Colors.red),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.teal),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.teal, end: Colors.transparent),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.transparent, end: Colors.red),
        weight: 1,
      ),
    ]).animate(controller);

    controller.addStatusListener((status) {
      // print(status);
      // if (status == AnimationStatus.forward) {
      //   controller.reverse();
      // }
      // if (status == AnimationStatus.reverse) {
      //   controller.forward();
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => InkWell(
            onTap: () {
              // controller.isCompleted == true
              //     ? controller.reverse()
              //     : controller.forward();

              controller.repeat();
            },
            child: Icon(
              Icons.favorite,
              size: sizeOfIcon.value,
              color: colorsOfIcon.value,
            ),
          ),
        ),
      ),
    );
  }
}
