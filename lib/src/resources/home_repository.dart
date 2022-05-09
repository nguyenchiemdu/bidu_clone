import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/resources/home_cloud_datasource.dart';

import '../models/product.dart';

class IHomeRepository {
  Future loadBanner() async {}
  Future loadCategory() async {}
  Future loadNewestProduct() async {}
  Future loadSuggestion() async {}
  Future loadTopProduct() async {}
  Future loadTopSeller() async {}
}

class HomeRepository implements IHomeRepository {
  final IHomeDataSource homeCloudDataSource;
  HomeRepository(this.homeCloudDataSource);
  @override
  Future loadBanner() async {
    try {
      final listBanner = await homeCloudDataSource.getListBanner();
      return listBanner;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return e;
    }
  }

  @override
  Future<List<Category>> loadCategory() async {
    try {
      final listCategory = await homeCloudDataSource.getListCategory();
      return listCategory;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }

  @override
  Future loadNewestProduct() async {
    try {
      final listNewestProduct =
          await homeCloudDataSource.getListNewestProduct();
      return listNewestProduct;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return e;
    }
  }

  @override
  Future<List<Product>> loadSuggestion() async {
    try {
      final listSuggestion = await homeCloudDataSource.getListSuggestion();
      return listSuggestion;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }

  @override
  Future<List<Product>> loadTopProduct() async {
    try {
      final listTopProduct = await homeCloudDataSource.getListTopProduct();
      return listTopProduct;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }

  @override
  Future<List<TopSeller>> loadTopSeller() async {
    try {
      final listTopSeller = await homeCloudDataSource.getListTopSeller();
      return listTopSeller;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }
}
