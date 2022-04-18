import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/newest_product.dart';
import 'package:bidu_clone/src/models/suggestion.dart';
import 'package:bidu_clone/src/models/top_product.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/resources/home_cloud_datasource.dart';

class IHomeRepository {
  Future loadBanner() async {}
  Future loadCategory() async {}
  Future loadNewestProduct() async {}
  Future loadSuggestion() async {}
  Future loadTopProduct() async {}
  Future loadTopSeller() async {}
}

class HomeRepository implements IHomeRepository {
  final IHomeDataSource _homeCloudDataSource = HomeCloudDataSource();
  @override
  Future<List<Banner>> loadBanner() async {
    try {
      final listBanner = await _homeCloudDataSource.getListBanner();
      return listBanner;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }

  @override
  Future<List<Category>> loadCategory() async {
    try {
      final listCategory = await _homeCloudDataSource.getListCategory();
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
  Future<List<NewestProduct>> loadNewestProduct() async {
    try {
      final listNewestProduct =
          await _homeCloudDataSource.getListNewestProduct();
      return listNewestProduct;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      return [];
    }
  }

  @override
  Future<List<Suggestion>> loadSuggestion() async {
    try {
      final listSuggestion = await _homeCloudDataSource.getListSuggestion();
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
  Future<List<TopProduct>> loadTopProduct() async {
    try {
      final listTopProduct = await _homeCloudDataSource.getListTopProduct();
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
      final listTopSeller = await _homeCloudDataSource.getListTopSeller();
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
