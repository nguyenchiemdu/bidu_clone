List<TopProduct> listTopProductFromMap(List<dynamic> json) {
  return List<TopProduct>.from(json.map((item) => TopProduct.fromMap(item)));
}

class TopProduct {
  TopProduct({
    required this.id,
    required this.name,
    required this.salePrice,
    required this.images,
  });

  String id;
  String name;
  num salePrice;
  List<dynamic> images;

  factory TopProduct.fromMap(Map<String, dynamic> json) => TopProduct(
      id: json['_id'],
      name: json['name'],
      salePrice: json['sale_price'],
      images: json['images']);
}
