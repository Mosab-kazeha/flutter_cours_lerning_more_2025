// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:bloc_secion/Auth/model/base_model.dart';
import 'package:bloc_secion/Auth/model/user_model.dart';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio;
  late Response response;

  LoginService({required this.dio});

  Future<BaseModel> login({required UserModel user}) async {
    try {
      response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: user.toMap(),
      );
      log("----------------${response.statusCode.toString()}");

      return SuccessModel(accessToken: response.data["accessToken"]);
    } catch (e) {
      log(e.toString());
      return FilerModel();
    }
  }
}
