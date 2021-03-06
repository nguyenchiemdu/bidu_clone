import 'dart:async';

import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/newest_product.dart';
import 'package:bidu_clone/src/models/suggestion.dart';
import 'package:bidu_clone/src/models/top_product.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/resources/home_repository.dart';

class HomeBloc {
  late IHomeRepository homeResource;
  // final _homeEventController = StreamController<HomeEvent>();
  final _bannerController = StreamController<List<Banner>>.broadcast();
  final _categoryController = StreamController<List<Category>>();
  final _newestProductController = StreamController<List<NewestProduct>>();
  final _suggestionController = StreamController<List<Suggestion>>();
  final _topProductController = StreamController<List<TopProduct>>();
  final _topSellerController = StreamController<List<TopSeller>>();
  final _navBarController = StreamController<int>.broadcast();

  Stream<List<Banner>> get bannerStream => _bannerController.stream;
  Stream<List<Category>> get categoryStream => _categoryController.stream;
  Stream<List<NewestProduct>> get newestProductStream =>
      _newestProductController.stream;
  Stream<List<Suggestion>> get suggestionStream => _suggestionController.stream;
  Stream<List<TopProduct>> get topProductStream => _topProductController.stream;
  Stream<List<TopSeller>> get topSellerStream => _topSellerController.stream;
  Stream<int> get navBarStream => _navBarController.stream;

  HomeBloc(this.homeResource) {
    // _homeEventController.stream.listen(_handleEvent);
    initLoad();
  }

  void initLoad() {
    _loadBanner();
    _loadCategory();
    _loadNewestProduct();
    _loadSuggestion();
    _loadTopProduct();
    _loadTopSeller();
  }
  // void add(HomeEvent event) {
  //   _homeEventController.add(event);
  // }
  // void _handleEvent(HomeEvent event) async {
  //   if (event is InitLoad) {
  //     _loadBanner();
  //     _loadCategory();
  //     _loadNewestProduct();
  //     _loadSuggestion();
  //     _loadTopProduct();
  //     _loadTopSeller();
  //   }
  // }

  void changePage(index) {
    _navBarController.sink.add(index);
  }

  void _loadBanner() async {
    var listBanner = await homeResource.loadBanner();
    //remove two first banner
    listBanner.removeAt(0);
    listBanner.removeAt(0);
    _bannerController.sink.add(listBanner);
  }

  void _loadCategory() async {
    final listCategory = await homeResource.loadCategory();
    _categoryController.sink.add(listCategory);
  }

  void _loadNewestProduct() async {
    final listNewestProduct = await homeResource.loadNewestProduct();
    _newestProductController.sink.add(listNewestProduct);
  }

  void _loadSuggestion() async {
    final listSuggestion = await homeResource.loadSuggestion();
    _suggestionController.sink.add(listSuggestion);
  }

  void _loadTopProduct() async {
    final listTopProduct = await homeResource.loadTopProduct();
    _topProductController.sink.add(listTopProduct);
  }

  void _loadTopSeller() async {
    final listTopSeller = await homeResource.loadTopSeller();
    _topSellerController.sink.add(listTopSeller);
  }
}
