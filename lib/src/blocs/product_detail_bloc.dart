import 'dart:async';

import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/models/product_detail.dart';
import 'package:bidu_clone/src/resources/product_detail_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailBloc extends BaseBLoC {
  late Product product;
  IProductDetailRepository productDetailRepository;
  ProductDetailBloc(this.productDetailRepository);
  int _selectedTabBar = 0;
  bool _isSeemore = false;
  final _productController = StreamController<Product>.broadcast();
  final _selectedTabBarController = StreamController<int>();
  final _appbarColorController = StreamController<Color>();
  final _productBasicInforController = StreamController<bool>();
  final _productDescriptionSeemoreController = StreamController<bool>();
  static Map<String, String> countryHashMap = {
    'VN': 'Việt Nam',
    'KO': 'Hàn Quốc',
  };
  Stream<Product> get productStream => _productController.stream;
  Stream<int> get selectedTabBarStream => _selectedTabBarController.stream;
  Stream<Color> get appbarColorStream => _appbarColorController.stream;
  Stream<bool> get productBasicInforStream =>
      _productBasicInforController.stream;
  Stream<bool> get productDescriptionSeemoreStream =>
      _productDescriptionSeemoreController.stream;
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

  void loadProductDetailById() async {
    String id = product.id;
    var productDetail = await productDetailRepository.loadProductDetailById(id);
    // debugPrint(productDetail.toString());
    if (productDetail.runtimeType == ProductDetail) {
      _productController.sink.add(productDetail);
    } else {
      _productController.addError(productDetail);
    }
  }

  static List processPrepareOrder(PrepareOrder prepareOrder) {
    late String duration;
    late bool isColorful;
    if (prepareOrder.day.isInteger()) {
      duration = '${prepareOrder.day} ngày';
      if (prepareOrder.day.toInt() == 1) {
        isColorful = true;
      } else {
        isColorful = false;
      }
    } else {
      isColorful = false;
      duration = 'Sau 4 ngày';
    }
    return [duration, isColorful];
  }

  static String getCountryText(ProductDetail productDetail) {
    // ProductDetail product;
    String countryCode = productDetail.shop.country;
    return countryHashMap[countryCode] ?? countryCode;
  }

  void changeProductBasicInforDisplayingStatus(bool newStatus) {
    _productBasicInforController.sink.add(newStatus);
  }

  void changeProductDescriptionSeemore() {
    _productDescriptionSeemoreController.sink.add(true);
    _isSeemore = true;
  }

  void cropHeighProductDescription(double height) {
    if (height > 500 && !_isSeemore) {
      _productDescriptionSeemoreController.sink.add(false);
    }
  }

  @override
  void dispose() {
    _productController.close();
    _selectedTabBarController.close();
    _appbarColorController.close();
    _productBasicInforController.close();
    _productDescriptionSeemoreController.close();
  }
}
