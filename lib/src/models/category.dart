List<Category> listCategoryFromMap(List<dynamic> json) {
  return List<Category>.from(json.map((item) => Category.fromMap(item)));
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.avatar,
  });

  String id;
  String name;
  String avatar;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json['_id'],
        name: json['name'],
        avatar: json['avatar'],
      );
}
