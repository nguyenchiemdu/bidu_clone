import 'dart:async';

import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/resources/home_repository.dart';

import '../models/product.dart';

class HomeBloc {
  late IHomeRepository homeRepository;
  // final _homeEventController = StreamController<HomeEvent>();
  final _bannerController = StreamController<List<Banner>>.broadcast();
  final _categoryController = StreamController<List<Category>>();
  final _newestProductController = StreamController<List<Product>>();
  final _suggestionController = StreamController<List<Product>>();
  final _topProductController = StreamController<List<Product>>();
  final _topSellerController = StreamController<List<TopSeller>>();
  final _navBarController = StreamController<int>.broadcast();

  Stream<List<Banner>> get bannerStream => _bannerController.stream;
  Stream<List<Category>> get categoryStream => _categoryController.stream;
  Stream<List<Product>> get newestProductStream =>
      _newestProductController.stream;
  Stream<List<Product>> get suggestionStream => _suggestionController.stream;
  Stream<List<Product>> get topProductStream => _topProductController.stream;
  Stream<List<TopSeller>> get topSellerStream => _topSellerController.stream;
  Stream<int> get navBarStream => _navBarController.stream;

  HomeBloc(this.homeRepository) {
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
    var listBanner = await homeRepository.loadBanner();
    //remove two first banner
    listBanner.removeAt(0);
    listBanner.removeAt(0);
    _bannerController.sink.add(listBanner);
  }

  void _loadCategory() async {
    final listCategory = await homeRepository.loadCategory();
    _categoryController.sink.add(listCategory);
  }

  void _loadNewestProduct() async {
    final listNewestProduct = await homeRepository.loadNewestProduct();
    _newestProductController.sink.add(listNewestProduct);
  }

  void _loadSuggestion() async {
    final listSuggestion = await homeRepository.loadSuggestion();
    _suggestionController.sink.add(listSuggestion);
  }

  void _loadTopProduct() async {
    final listTopProduct = await homeRepository.loadTopProduct();
    _topProductController.sink.add(listTopProduct);
  }

  void _loadTopSeller() async {
    final listTopSeller = await homeRepository.loadTopSeller();
    _topSellerController.sink.add(listTopSeller);
  }
}
