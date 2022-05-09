import 'dart:async';

import 'package:bidu_clone/src/blocs/base_bloc.dart';
import 'package:bidu_clone/src/models/banner.dart' as banner_model;
import 'package:bidu_clone/src/models/category.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/resources/home_repository.dart';
import '../models/product.dart';

class HomeBloc extends BaseBLoC {
  late IHomeRepository homeRepository;
  //TODO: remove UI loic ra khoi BLoC DONE
  final _bannerController =
      StreamController<List<banner_model.Banner>>.broadcast();
  final _categoryController = StreamController<List<Category>>();
  final _newestProductController = StreamController<List<Product>>();
  final _suggestionController = StreamController<List<Product>>();
  final _topProductController = StreamController<List<Product>>();
  final _topSellerController = StreamController<List<TopSeller>>();
  final _navBarController = StreamController<int>.broadcast();
  final _scrollStreamController = StreamController<double>();
  final _backtoTopController = StreamController<bool>();
  final _bannerIndicatorController = StreamController<int>.broadcast();
  Stream<List<banner_model.Banner>> get bannerStream =>
      _bannerController.stream;
  Stream<List<Category>> get categoryStream => _categoryController.stream;
  Stream<List<Product>> get newestProductStream =>
      _newestProductController.stream;
  Stream<List<Product>> get suggestionStream => _suggestionController.stream;
  Stream<List<Product>> get topProductStream => _topProductController.stream;
  Stream<List<TopSeller>> get topSellerStream => _topSellerController.stream;
  Stream<int> get navBarStream => _navBarController.stream;
  Stream<double> get scrollStream => _scrollStreamController.stream;
  Stream<bool> get backToTopStream => _backtoTopController.stream;
  Stream<int> get bannerIndicatorStream => _bannerIndicatorController.stream;
  bool isCategoryCollapsed = false;
  bool _isShowedBackToTop = false;
  double? categoryHeight;
  HomeBloc(this.homeRepository) {
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

  void updateCategory(
    double pixels,
  ) {
    _scrollStreamController.sink.add(pixels);
  }

  void updateBackToTopButton(double pixels) {
    if ((pixels > 1000 && !_isShowedBackToTop) ||
        (pixels < 1000 && _isShowedBackToTop)) {
      _isShowedBackToTop = !_isShowedBackToTop;
      _backtoTopController.sink.add(_isShowedBackToTop);
    }
  }

  void seeMore(double pixels) {
    updateCategory(pixels);
    isCategoryCollapsed = false;
  }

  void changePage(index) {
    _navBarController.sink.add(index);
  }

  void updateBannerIndicator(int index) {
    _bannerIndicatorController.sink.add(index);
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
    if (listNewestProduct.runtimeType == List<Product>) {
      _newestProductController.sink.add(listNewestProduct);
    } else {
      _newestProductController.addError(listNewestProduct);
    }
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

  @override
  void dispose() {
    _bannerController.close();
    _categoryController.close();
    _newestProductController.close();
    _suggestionController.close();
    _topProductController.close();
    _topSellerController.close();
    _navBarController.close();
    _scrollStreamController.close();
    _backtoTopController.close();
    _bannerIndicatorController.close();
  }
}
