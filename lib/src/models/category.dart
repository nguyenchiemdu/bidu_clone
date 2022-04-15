List<Category> listCategoryFromMap(List<dynamic> json) {
  return List<Category>.from(json.map((item) => Category.fromMap(item)));
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.avatar,
    required this.priority,
  });

  String id;
  String name;
  String avatar;
  int priority;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
      id: json['_id'],
      name: json['name'],
      avatar: json['avatar'],
      priority: json['priority']);
}
