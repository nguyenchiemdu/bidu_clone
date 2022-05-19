import 'dart:async';

import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/resources/product_detail_repository.dart';
import 'package:flutter/material.dart';

import '../../common/app_strings.dart';

class ProductDetailBloc extends BaseBLoC {
  IProductDetailRepository productDetailRepository;
  ProductDetailBloc(this.productDetailRepository);
  late Product product;
  static const Map<String, String> countryHashMap = {
    'VN': 'Việt Nam',
    'KO': 'Hàn Quốc',
  };
  int _selectedTabBar = 0;
  bool _isSeemore = false;
  bool _isProductBasicInforSeemore = true;
  Color _appBarColor = Colors.transparent;

  final _productController = StreamController<Product>.broadcast();
  final _selectedTabBarController = StreamController<int>();
  final _appbarColorController = StreamController<Color>();
  final _productBasicInforController = StreamController<bool>.broadcast();
  final _productDescriptionSeemoreController =
      StreamController<bool>.broadcast();
  final _bannerIndicatorController = StreamController<int>.broadcast();

  Stream<Product> get productStream => _productController.stream;
  Stream<int> get selectedTabBarStream => _selectedTabBarController.stream;
  Stream<Color> get appbarColorStream => _appbarColorController.stream;
  Stream<bool> get productBasicInforStream =>
      _productBasicInforController.stream;
  Stream<bool> get productDescriptionSeemoreStream =>
      _productDescriptionSeemoreController.stream;
  Stream<int> get bannerIndicatorStream => _bannerIndicatorController.stream;
  bool get isProductBasicInforSeemore => _isProductBasicInforSeemore;
  Color get appBarColor => _appBarColor;

  void initLoad(Product productOld) {
    product = productOld;
    loadProductDetailById();
  }

  void changeSelectedTabBar(int index) {
    _selectedTabBar = index;
    _selectedTabBarController.sink.add(_selectedTabBar);
  }

  void onScroll(double screenPosition) {
    if (screenPosition <= 0 && _appBarColor != Colors.transparent) {
      _appBarColor = Colors.transparent;
      _appbarColorController.sink.add(_appBarColor);
    } else if (screenPosition > 0 &&
        screenPosition < 200 &&
        _appBarColor != Colors.white.withOpacity(0.5)) {
      _appBarColor = (Colors.white.withOpacity(0.5));
      _appbarColorController.sink.add(_appBarColor);
    } else if (screenPosition >= 200 && _appBarColor != Colors.white) {
      _appBarColor = (Colors.white);
      _appbarColorController.sink.add(_appBarColor);
    }
  }

  void loadProductDetailById() async {
    String id = product.id;
    //TODO: catch error DONE, can lam them o cac ham load khac
    final Product? productDetail = await productDetailRepository
        .loadProductDetailById(id)
        .onError((error, stackTrace) {
      _productController.addError(error!);
    });

    if (productDetail != null) {
      product = productDetail;
      _productController.sink.add(productDetail);
    }
  }

  static List processPrepareOrder(PrepareOrder prepareOrder) {
    late String duration;
    late bool isColorful;
    if (prepareOrder.day.isInteger()) {
      duration = '${prepareOrder.day} ${AppString.day}';
      if (prepareOrder.day.toInt() == 1) {
        isColorful = true;
      } else {
        isColorful = false;
      }
    } else {
      isColorful = false;
      duration = AppString.after4days;
    }
    return [duration, isColorful];
  }

  static String getCountryText(Product productDetail) {
    // ProductDetail product;
    String countryCode = productDetail.shop?.country ?? 'Loading';
    return countryHashMap[countryCode] ?? countryCode;
  }

  void changeProductBasicInforDisplayingStatus(bool newStatus) {
    _isProductBasicInforSeemore = newStatus;
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

  void updateBannerIndicator(int index) {
    _bannerIndicatorController.sink.add(index);
  }

  @override
  void dispose() {
    _productController.close();
    _selectedTabBarController.close();
    _appbarColorController.close();
    _productBasicInforController.close();
    _productDescriptionSeemoreController.close();
    _bannerIndicatorController.close();
  }
}
