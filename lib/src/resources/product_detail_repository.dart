import 'package:bidu_clone/src/resources/product_detail_cloud_datasource.dart';
import 'package:flutter/material.dart';

class IProductDetailRepository {
  Future loadProductDetailById(String id) async {}
}

class ProductDetailRepository implements IProductDetailRepository {
  IProductDetailDataSource productDetailCloudDataSource;
  ProductDetailRepository(this.productDetailCloudDataSource);
  @override
  //TODO: luon tra ve ProductDetail
  Future loadProductDetailById(String id) async {
    try {
      final productDetail =
          await productDetailCloudDataSource.getProductDetailById(id);
      return productDetail;
    } catch (e, s) {
      //TODO: dung throw
      debugPrint(e.toString());
      debugPrint(s.toString());
      return e;
    }
  }
}
