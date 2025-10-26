import 'dart:io';

import 'package:auth_flow/main.dart';
import 'package:auth_flow/model/user_model.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();
String token = "";
    // File file = File("/Users/abdtll/Desktop/auth_flow/token.txt");

Future<bool> logIn({required String username, required String password}) async {
  try {
    Response response = await dio.post(
      "https://dummyjson.com/auth/login",
      data: {"username": username, "password": password},
    );
    print(response.data['accessToken']);
    token = response.data['accessToken'];
    // file.writeAsString(token);
    storage.setString("token", token);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<UserModel> getMyInfo() async {
  Response response = await dio.get("https://dummyjson.com/auth/me",
  options: Options(
    headers: {
      "Authorization":token
    }
  )
  );
  return UserModel.fromMap(response.data);
}
