List<Suggestion> listSuggestionFromMap(List<dynamic> json) {
  return List<Suggestion>.from(json.map((item) => Suggestion.fromMap(item)));
}

class Suggestion {
  Suggestion(
      {required this.id,
      required this.name,
      required this.salePrice,
      required this.images,
      required this.isQuaranteed});

  String id;
  String name;
  num salePrice;
  bool isQuaranteed;
  List<dynamic> images;

  factory Suggestion.fromMap(Map<String, dynamic> json) => Suggestion(
      id: json['_id'],
      name: json['name'],
      salePrice: json['sale_price'],
      images: json['images'],
      isQuaranteed: json['is_guaranteed_item']);
}
