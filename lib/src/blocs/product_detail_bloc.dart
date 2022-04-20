import 'dart:async';

import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';

class ProductDetailBloc extends BaseBLoC {
  late Product product;
  // ProductDetailBloc();
  final _productController = StreamController<Product>.broadcast();
  Stream<Product> get productStream => _productController.stream;

  @override
  void dispose() {
    _productController.close();
  }
}
