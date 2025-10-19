// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdactModel {
  int id;
  String title;
  String category;
  ProdactModel({required this.id, required this.title, required this.category});

  static ProdactModel formMap(Map<String, dynamic> map) {
    return ProdactModel(
      id: map["id"],
      title: map['title'],
      category: map['category'],
    );
  }
}
