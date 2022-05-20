import 'dart:async';

import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/resources/product_detail_cloud_datasource.dart';

class IProductDetailRepository {
  Future loadProductDetailById(String id) async {}
}

class ProductDetailRepository implements IProductDetailRepository {
  IProductDetailDataSource productDetailCloudDataSource;
  ProductDetailRepository(this.productDetailCloudDataSource);
  @override
  Future loadProductDetailById(String id) async {
    //TODO: luon tra ve ProductDetail ,dung rethrow DONE
    try {
      final Product productDetail =
          await productDetailCloudDataSource.getProductDetailById(id);
      return productDetail;
    } catch (e) {
      rethrow;
    }
  }
}
