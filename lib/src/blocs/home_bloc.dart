import 'dart:async';

import 'package:bidu_clone/src/resources/home_resource.dart';
import 'package:flutter/foundation.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc with ChangeNotifier {
  final HomeResource homeResource = HomeResource();

  final _homeEventController = StreamController<HomeEvent>();
  final _bannerController = StreamController<HomeState>.broadcast();
  final _categoryController = StreamController<HomeState>();
  final _newestProductController = StreamController<HomeState>();
  final _suggestionController = StreamController<HomeState>();
  final _topProductController = StreamController<HomeState>();
  final _topSellerController = StreamController<HomeState>();

  Stream<HomeState> get bannerStream => _bannerController.stream;
  Stream<HomeState> get categoryStream => _categoryController.stream;
  Stream<HomeState> get newestProductStream => _newestProductController.stream;
  Stream<HomeState> get suggestionStream => _suggestionController.stream;
  Stream<HomeState> get topProductStream => _topProductController.stream;
  Stream<HomeState> get topSellerStream => _topSellerController.stream;

  HomeBloc() {
    _homeEventController.stream.listen(_handleEvent);
  }

  void add(HomeEvent event) {
    _homeEventController.add(event);
  }

  void _handleEvent(HomeEvent event) async {
    if (event is InitLoad) {
      _loadBanner();
      _loadCategory();
      _loadNewestProduct();
      _loadSuggestion();
      _loadTopProduct();
      _loadTopSeller();
    }
  }

  void _loadBanner() async {
    final listBanner = await homeResource.loadBanner();
    _bannerController.sink.add(BannerLoaded(listBanner: listBanner));
  }

  void _loadCategory() async {
    final listCategory = await homeResource.loadCategory();
    _categoryController.sink.add(CategoryLoaded(listCategory: listCategory));
  }

  void _loadNewestProduct() async {
    final listNewestProduct = await homeResource.loadNewestProduct();
    _newestProductController.sink
        .add(NewestProductLoaded(listNewestProduct: listNewestProduct));
  }

  void _loadSuggestion() async {
    final listSuggestion = await homeResource.loadSuggestion();
    _suggestionController.sink
        .add(SuggestionLoaded(listSuggestion: listSuggestion));
  }

  void _loadTopProduct() async {
    final listTopProduct = await homeResource.loadTopProduct();
    _topProductController.sink
        .add(TopProductLoaded(listTopProduct: listTopProduct));
  }

  void _loadTopSeller() async {
    final listTopSeller = await homeResource.loadTopSeller();
    _topSellerController.sink
        .add(TopSellerLoaded(listTopSeller: listTopSeller));
  }
}
