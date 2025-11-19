
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_countroller.dart';

class PhotoPage extends StatelessWidget {
  PhotoPage({super.key});

  final control = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetBuilder<PhotoController>(
          builder: (controller) {
            if (controller.photo==null) {
              return CircularProgressIndicator();
            } else {
            return SizedBox.square(
              dimension: 200,
              
              child: Image.network(controller.photo!.url,
              errorBuilder: (context, error, stackTrace) {
                return FlutterLogo(size: 300,);
              },
              ));
              
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
        await  control.getPhoto();
        },
      ),
    );
  }
}
