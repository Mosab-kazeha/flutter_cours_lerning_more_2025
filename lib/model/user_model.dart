// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String username;
  String email;
  String image;
  UserModel({
    required this.username,
    required this.email,
    required this.image,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? image,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(username: $username, email: $email, image: $image)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.image == image;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ image.hashCode;
}
