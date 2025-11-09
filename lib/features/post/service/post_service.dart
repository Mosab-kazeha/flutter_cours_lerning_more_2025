// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc_secion/features/Auth/model/base_model.dart';
import 'package:bloc_secion/features/post/model/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  Dio dio;
  late Response response;
  PostService({required this.dio});

  Future<BaseModel> getPoset() async {
    try {
      response = await dio.get("https://dummyjson.com/posts/tag/life");

      PostModel post = PostModel.fromMap(response.data["posts"][0]);
      log(response.statusCode.toString());
      return post;
    } catch (e) {
      log(e.toString());
      return FilerModel();
    }
  }
}
