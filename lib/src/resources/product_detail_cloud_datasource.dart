import 'dart:convert';
import 'package:bidu_clone/src/models/product.dart';

import 'package:flutter/material.dart';

import '../../common/server.dart';
import 'package:http/http.dart' as http;

class IProductDetailDataSource {
  Future getProductDetailById(String id) async {}
}

class ProductDetailCloudDataSource implements IProductDetailDataSource {
  final _productDetailUrl = '/api/v1/mobile/product-explores/';
  final _productDetaiHeader = {'': ''};

  @override
  Future getProductDetailById(String id) async {
    try {
      var url = Uri.parse('$endPoint1$_productDetailUrl$id');
      final respond = await http.get(url, headers: _productDetaiHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final productDetail = Product.productDetailFromMap(dataDecode['data']);
        return productDetail;
      }
    } catch (e) {
      debugPrint(e.toString());
      // debugPrint(s.toString());
      rethrow;
    }
  }
}
