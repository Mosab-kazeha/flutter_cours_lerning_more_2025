
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/photo_model.dart' show PhotoModel;

class CounterCountroller extends GetxController{
  int counter=0;


  increament(){
    counter++;
    update();
  }
}


class CoutnerObserver extends GetxController {
  RxInt counter = 0.obs;


  increament(){
    counter.value++;
    if (counter.value>5) {
      Get.to(()=> CounterPage());
          }
  }

  restoreToZero(){
    counter.value= 0;
    // Get.showSnackbar(GetSnackBar(title: "Hello World",message:'Hello World',));
    Get.snackbar("'title'", "'message'");
  }
}

// ? https://jsonplaceholder.typicode.com/photos/1


class PhotoController extends GetxController {
PhotoModel? photo;


getPhoto()async{
  Response response =await GetConnect().get('https://jsonplaceholder.typicode.com/photos/1');
  if (response.isOk) {
    print(response.body);
    photo = PhotoModel.fromMap(response.body);
    update();
  } else {
    Get.snackbar("Sorry",'There is a problem With your Connection');
  }
}


}

class PhotoObserverListModel extends GetxController{

  var photos = <PhotoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllPhoto();
  }

  getAllPhoto()async{
    if (photos.isNotEmpty) {
      Get.snackbar('Catuion','This is from cache');
    } else {


    Response response = await GetConnect().get("https://jsonplaceholder.typicode.com/photos/");
    if (response.isOk) {
    for (var i = 0; i < response.body.length; i++) {
      photos.add(PhotoModel.fromMap(response.body[i]));
    }
    update();  
    } else {
      Get.to(()=>CounterPage());
    }
          
    }

  }
  
}