import 'dart:async';

import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailBloc extends BaseBLoC {
  late Product product;
  // ProductDetailBloc();
  int _selectedTabBar = 0;
  final _productController = StreamController<Product>.broadcast();
  final _selectedTabBarController = StreamController<int>();
  final _appbarColorController = StreamController<Color>();

  Stream<Product> get productStream => _productController.stream;
  Stream<int> get selectedTabBarStream => _selectedTabBarController.stream;
  Stream<Color> get appbarColorStream => _appbarColorController.stream;
  // int get selectedTabBar => _selectedTabBar;
  // set appBarMaxHeight(double? height) {
  //   _appBarMaxHeight = height ?? 0;
  // }

  void changeSelectedTabBar(int index) {
    _selectedTabBar = index;
    _selectedTabBarController.sink.add(_selectedTabBar);
  }

  // void updateTabbarPosition(double position) {
  //   _tabbarPosition = position;
  // }

  void onScroll(double screenPosition) {
    // const marginTop = 3;
    // if (dy < _appBarMaxHeight - marginTop && !_isTabBarPinned) {
    //   debugPrint('jump');
    //   // _scrollableController.sink.add(false);
    //   _isTabBarPinned = true;
    //   scrollController.jumpTo(_tabbarPosition - _appBarMaxHeight + marginTop);
    // } else if (dy >= _appBarMaxHeight - marginTop && _isTabBarPinned) {
    //   debugPrint('unjump');
    //   _isTabBarPinned = false;
    //   // _scrollableController.sink.add(true);
    // }
    Color appbarColor = Colors.transparent;
    if (screenPosition > 0 && screenPosition < 200) {
      appbarColor = (Colors.white.withOpacity(0.5));
    } else if (screenPosition >= 200) {
      appbarColor = (Colors.white);
    }
    _appbarColorController.sink.add(appbarColor);
  }

  @override
  void dispose() {
    _productController.close();
    _selectedTabBarController.close();
    _appbarColorController.close();
  }
}
