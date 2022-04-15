List<NewestProduct> listNewestProductFromMap(List<dynamic> json) {
  return List<NewestProduct>.from(
      json.map((item) => NewestProduct.fromMap(item)));
}

class NewestProduct {
  NewestProduct(
      {required this.id,
      required this.name,
      required this.salePrice,
      required this.images,
      required this.discountPercent});

  String id;
  String name;
  num salePrice;
  num discountPercent;
  List<dynamic> images;

  factory NewestProduct.fromMap(Map<String, dynamic> json) => NewestProduct(
      id: json['_id'],
      name: json['name'],
      salePrice: json['sale_price'],
      images: json['images'],
      discountPercent: json['discount_percent']);
}
