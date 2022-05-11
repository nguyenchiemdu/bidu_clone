import 'dart:async';

import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';

class ProductDetailBloc extends BaseBLoC {
  late Product product;
  // ProductDetailBloc();
  int _selectedTabBar = 0;
  final _productController = StreamController<Product>.broadcast();
  final _selectedTabBarController = StreamController<int>();
  Stream<Product> get productStream => _productController.stream;
  Stream<int> get selectedTabBarStream => _selectedTabBarController.stream;
  // int get selectedTabBar => _selectedTabBar;
  void changeSelectedTabBar(int index) {
    _selectedTabBar = index;
    _selectedTabBarController.sink.add(_selectedTabBar);
  }

  @override
  void dispose() {
    _productController.close();
    _selectedTabBarController.close();
  }
}
