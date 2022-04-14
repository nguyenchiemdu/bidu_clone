import 'package:bidu_clone/src/models/banner.dart';
import 'package:bidu_clone/src/models/newest_product.dart';
import 'package:bidu_clone/src/models/top_product.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:equatable/equatable.dart';

import '../models/category.dart';
import '../models/suggestion.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

//class HomeInitial extends HomeState {}

class BannerLoaded extends HomeState {
  final List<Banner> listBanner;

  const BannerLoaded({required this.listBanner});

  @override
  List<Object> get props => [listBanner];
}

class CategoryLoaded extends HomeState {
  final List<Category> listCategory;

  const CategoryLoaded({required this.listCategory});

  @override
  List<Object> get props => [listCategory];
}

class NewestProductLoaded extends HomeState {
  final List<NewestProduct> listNewestProduct;

  const NewestProductLoaded({required this.listNewestProduct});

  @override
  List<Object> get props => [listNewestProduct];
}

class SuggestionLoaded extends HomeState {
  final List<Suggestion> listSuggestion;

  const SuggestionLoaded({required this.listSuggestion});

  @override
  List<Object> get props => [listSuggestion];
}

class TopProductLoaded extends HomeState {
  final List<TopProduct> listTopProduct;

  const TopProductLoaded({required this.listTopProduct});

  @override
  List<Object> get props => [listTopProduct];
}

class TopSellerLoaded extends HomeState {
  final List<TopSeller> listTopSeller;

  const TopSellerLoaded({required this.listTopSeller});

  @override
  List<Object> get props => [listTopSeller];
}
