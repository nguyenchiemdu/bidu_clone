import 'dart:async';

import 'package:bidu_clone/src/models/product.dart';

class ProductDetailBloc {
  Product product;
  ProductDetailBloc(this.product);
  final _productController = StreamController<Product>.broadcast();
  Stream<Product> get productStream => _productController.stream;
}
