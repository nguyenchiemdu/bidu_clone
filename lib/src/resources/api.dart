// import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Api {
  static Future getListBanner() async {
    var url = Uri.parse(
        'https://commerce-staging.bidu.com.vn/api/v2/mobile/home/banner-categories-v2');
    var response = await http.get(url, headers: {
      'Authorization':
          'Bidu eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmOGMyZjhmOTkwOTQwMzMzMDIxNzMzNSIsImlhdCI6MTYyNjI2MDUwMiwiZXhwIjoxNjU3Nzk2NTAyfQ.TeVCWowYfhwnMX3QjBfP58Aq-MrLA5FRzUMAHeGMNDM'
    });
    return response.body;
  }

  static Future getListCategory() async {
    var url = Uri.parse(
        'https://commerce.bidu.com.vn/api/v1/cms-admin/categories?is_paginate=true&page=1&limit=1000');
    var response = await http.get(url, headers: {
      'Authorization':
          'Bidu eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmOGMyZjhmOTkwOTQwMzMzMDIxNzMzNSIsImlhdCI6MTYyOTY5NTU0NywiZXhwIjoxNjYxMjMxNTQ3fQ.lkx8JJg_tUsLDLEySjUy4z7CnTx6iuGsIr84buiEqME'
    });
    return response.body;
  }

  static Future getListNewestProducts() async {
    var url = Uri.parse(
        'https://commerce-staging.bidu.com.vn/api/v2/mobile/home/newest-product');
    var response = await http.get(url);
    return response.body;
  }

  static Future getListTopSellers() async {
    var url = Uri.parse(
        'https://commerce.bidu.com.vn//api/v2/mobile/home/top-seller');
    var response = await http.get(url, headers: {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxN2I2OGJjNTQ3MjlkMDAxYTA5YTI2MCIsImlhdCI6MTYzNTgzNjMzMSwiZXhwIjoxNjY3MzcyMzMxfQ.DVZR_t9CrnbKKxkuqZY_Ljt3lgrTe4MSsG84zy9mse4',
      'Accept-Language': 'vi'
    });
    return response.body;
  }
}
