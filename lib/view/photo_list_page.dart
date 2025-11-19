
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../controller/counter_countroller.dart';


final con  = PhotoObserverListModel();
class PhotoListPage extends StatefulWidget {
   PhotoListPage({super.key});

  @override
  State<PhotoListPage> createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  final controller = Get.put(con);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              
            });
            if (Get.isDarkMode) {
              
            Get.changeTheme(ThemeData.light());
            } else {
              
            Get.changeTheme(ThemeData.dark());
            }
          }, icon: Icon( Get.isDarkMode ?  Icons.light: Icons.dark_mode))
        ],
      ),
      body: Center(
        child: Obx(() {
          if (controller.photos.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: controller.photos.length,
              itemBuilder: (context, index) {
              return ListTile(title: Text(controller.photos.elementAt(index).title),);
            },);
          }
        },),
      ),
    );
  }
}