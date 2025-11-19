// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotoModel {
  String title;
  String url;
  String thumbnail;
  PhotoModel({
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  PhotoModel copyWith({
    String? title,
    String? url,
    String? thumbnail,
  }) {
    return PhotoModel(
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnail,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnail: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) => PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PhotoModel(title: $title, url: $url, thumbnail: $thumbnail)';

  @override
  bool operator ==(covariant PhotoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.url == url &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ thumbnail.hashCode;
}
