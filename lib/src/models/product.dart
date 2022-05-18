List<Product> listProductFromMap(List<dynamic> json) {
  return List<Product>.from(json.map((item) => Product.fromMap(item)));
}

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.salePrice,
      required this.images,
      required this.discountPercent,
      required this.beforeSalePrice});

  String id;
  String name;
  num salePrice;
  num discountPercent;
  num beforeSalePrice;
  List<dynamic> images;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json['_id'],
      name: json['name'],
      salePrice: json['sale_price'] ?? 0,
      beforeSalePrice: json['before_sale_price'] ?? 0,
      images: json['images'],
      discountPercent: json['discount_percent']);
  //TODO:
}
