// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseModel {}

class SuccessModel extends BaseModel {
  String accessToken;
  SuccessModel({required this.accessToken});
}

class FilerModel extends BaseModel {}
