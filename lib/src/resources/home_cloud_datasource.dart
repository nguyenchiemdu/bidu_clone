import 'dart:convert';

import 'package:flutter/material.dart';

import '../../common/server.dart';
import '../models/banner.dart';
import 'package:bidu_clone/common/server.dart';
import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class IHomeDataSource {
  Future getListBanner() async {}
  Future getListCategory() async {}
  Future getListNewestProduct() async {}
  Future getListSuggestion() async {}
  Future getListTopProduct() async {}
  Future getListTopSeller() async {}
}

class HomeCloudDataSource implements IHomeDataSource {
  final _bannerUrl = 'api/v2/mobile/home/banner-categories-v2';
  final _categoryUrl = '/api/v1/mobile/categories';
  final _newestProductUrl = 'api/v2/mobile/home/newest-product';
  final _suggestionUrl =
      'api/v2/mobile/suggest-products?page=1&limit=20&random_number=11';
  final _topProductUrl = 'api/v2/mobile/home/top-product';
  final _topSellerUrl = 'api/v2/mobile/home/top-seller';

  final _bannerHeader = {
    'Authorization':
        'Bidu eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmOGMyZjhmOTkwOTQwMzMzMDIxNzMzNSIsImlhdCI6MTYyNjI2MDUwMiwiZXhwIjoxNjU3Nzk2NTAyfQ.TeVCWowYfhwnMX3QjBfP58Aq-MrLA5FRzUMAHeGMNDM'
  };
  final _categoryHeader = {
    'Authorization':
        'Bidu eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmZWViNTQ2MTliMTU5MDAxOTY2YWQyMCIsImlhdCI6MTYzMDExNjk0NywiZXhwIjoxNjYxNjUyOTQ3fQ.17QwyyVE5q_TGNvC97gF76ZYzm2FbQQE0VA26A5U7HY'
  };
  final _newestProductHeader = {'': ''};
  final _suggestionHeader = {'': ''};
  final _topProductHeader = {'': ''};
  final _topSellerHeader = {
    'Authorization':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxN2I2OGJjNTQ3MjlkMDAxYTA5YTI2MCIsImlhdCI6MTYzNTgzNjMzMSwiZXhwIjoxNjY3MzcyMzMxfQ.DVZR_t9CrnbKKxkuqZY_Ljt3lgrTe4MSsG84zy9mse4',
    'Accept-Language': 'vi'
  };
  @override
  Future getListBanner() async {
    try {
      var url = Uri.parse('$endPoint1$_bannerUrl');
      final respond = await http.get(url, headers: _bannerHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listBanner =
            listBannerFromMap(dataDecode['data']['system_banner']);
        return listBanner;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return e;
    }
  }

  @override
  Future<List<Category>> getListCategory() async {
    try {
      var url = Uri.parse('$endPoint2$_categoryUrl');
      final respond = await http.get(url, headers: _categoryHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listCategory = listCategoryFromMap(dataDecode['data']);
        return listCategory;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return [];
    }
  }

  @override
  Future getListNewestProduct() async {
    try {
      var url = Uri.parse('$endPoint1$_newestProductUrl');
      final respond = await http.get(url, headers: _newestProductHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listNewestProduct = listProductFromMap(dataDecode['data']);
        return listNewestProduct;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return e;
    }
  }

  @override
  Future<List<Product>> getListSuggestion() async {
    try {
      var url = Uri.parse('$endPoint1$_suggestionUrl');
      final respond = await http.get(url, headers: _suggestionHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listSuggestion = listProductFromMap(dataDecode['data']);
        return listSuggestion;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return [];
    }
  }

  @override
  Future<List<Product>> getListTopProduct() async {
    try {
      var url = Uri.parse('$endPoint1$_topProductUrl');
      final respond = await http.get(url, headers: _topProductHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listTopProduct = listProductFromMap(dataDecode['data']);
        return listTopProduct;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return [];
    }
  }

  //TODO: toi gian code
  @override
  Future<List<TopSeller>> getListTopSeller() async {
    try {
      var url = Uri.parse('$endPoint1$_topSellerUrl');
      final respond = await http.get(url, headers: _topSellerHeader);
      final rawData = respond.body;
      final dataDecode = json.decode(rawData);
      if (dataDecode['success'] == true) {
        final listTopSeller = listTopSellerFromMap(dataDecode['data']);
        return listTopSeller;
      }
      return [];
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return [];
    }
  }
}
