import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'controller/counter_countroller.dart';
import 'view/photo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(seconds: 2),

      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final control = Get.put(CounterCountroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetBuilder<CounterCountroller>(
          builder: (controller) {
            return Text(
              controller.counter.toString(),
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PhotoListPage());
        },
      ),
    );
  }
}

class CounterPageWithObserver extends StatelessWidget {
  CounterPageWithObserver({super.key});

  final control = Get.put(CoutnerObserver());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() {
          return Text(
            control.counter.value.toString(),
            style: TextStyle(fontSize: 32),
          );
        }),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              control.increament();
            },
          ),
          FloatingActionButton(
            heroTag: "a",
            onPressed: () {
              control.restoreToZero();
            },
          ),
        ],
      ),
    );
  }
}
