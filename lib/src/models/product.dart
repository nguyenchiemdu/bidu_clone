import 'dart:math';

List<Product> listProductFromMap(List<dynamic> json) {
  return List<Product>.from(json.map((item) => Product.fromMap(item)));
}

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.salePrice,
      required this.images,
      required this.discountPercent,
      required this.beforeSalePrice,
      this.description,
      this.shop,
      this.timePrepareOrders,
      this.productBasicInfors,
      this.feedbacks});

  String id;
  String name;
  num salePrice;
  num discountPercent;
  num beforeSalePrice;
  List<dynamic> images;
  String? description;
  Shop? shop;
  List<PrepareOrder>? timePrepareOrders;
  List<ProductBasicInfor>? productBasicInfors;
  Feedbacks? feedbacks;
  factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json['_id'],
      name: json['name'],
      salePrice: json['sale_price'] ?? 0,
      beforeSalePrice: json['before_sale_price'] ?? 0,
      images: json['images'],
      discountPercent: json['discount_percent']);
  factory Product.productDetailFromMap(Map<String, dynamic> json) {
    // debugPrint(json['feedbacks'].toString());
    return Product(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        salePrice: json['sale_price'] ?? 0,
        beforeSalePrice: json['before_sale_price'] ?? 0,
        images: json['images'],
        discountPercent: json['discount_percent'],
        shop: Shop.fromMap(json['shop']),
        timePrepareOrders: List<PrepareOrder>.from(json['time_prepare_orders']
            .map((prepareOrder) => PrepareOrder.fromMap(prepareOrder))),
        productBasicInfors: List<ProductBasicInfor>.from(
            json['product_detail_infos'].map((productBasicInfor) =>
                ProductBasicInfor.fromMap(productBasicInfor))),
        feedbacks: Feedbacks.fromMap(json['feedbacks']));
  }
  //TODO: DONE
}

class PrepareOrder {
  PrepareOrder({
    required this.day,
    required this.value,
    required this.unit,
  });
  String unit;
  String day;
  double value;
  factory PrepareOrder.fromMap(Map<String, dynamic> json) {
    return PrepareOrder(
        day: json['day'], value: json['value'].toDouble(), unit: json['unit']);
  }
}

class Shop {
  Shop(
      {required this.country,
      required this.name,
      required this.shopRating,
      required this.chatResponseByPercent,
      required this.avatarLink,
      required this.shippingMethod,
      required this.avgShippingTime});
  String country;
  String name;
  double shopRating;
  int chatResponseByPercent;
  String avatarLink;
  List<ShippingMethod> shippingMethod;
  AvgShippingTime avgShippingTime;
  factory Shop.fromMap(Map<String, dynamic> json) {
    // debugPrint(json.toString());
    return Shop(
        country: json['country'],
        name: json['name'],
        shopRating: json['rank_policy']['data']['shopRating'].toDouble() ?? 0,
        chatResponseByPercent:
            json['rank_policy']['data']['chatResponseByPercent'] ?? 0,
        avatarLink: json['avatar'],
        shippingMethod: List<ShippingMethod>.from(json['shipping_methods']
            .map((item) => ShippingMethod.fromMap(item))),
        avgShippingTime: AvgShippingTime.fromMap(json['avg_shipping_time']));
  }
}

class ShippingMethod {
  ShippingMethod(
      {required this.isActive,
      required this.name,
      required this.nameQuery,
      required this.token});
  bool isActive;
  String name;
  String nameQuery;
  String token;
  factory ShippingMethod.fromMap(Map<String, dynamic> json) {
    // debugPrint(json.toString());
    return ShippingMethod(
        isActive: json['is_active'],
        name: json['name'],
        nameQuery: json['name_query'],
        token: json['token']);
  }
}

class AvgShippingTime {
  AvgShippingTime({
    required this.min,
    required this.max,
  });
  int min;
  int max;
  factory AvgShippingTime.fromMap(Map<String, dynamic> json) =>
      AvgShippingTime(min: json['min'] ?? 0, max: json['max'] ?? 0);
}

class ProductBasicInfor {
  ProductBasicInfor({
    required this.value,
    required this.values,
    required this.name,
  });
  List values;
  String value;
  String name;
  factory ProductBasicInfor.fromMap(Map<String, dynamic> json) =>
      ProductBasicInfor(
          name: json['name'], value: json['value'], values: json['values']);
}

class Feedbacks {
  Feedbacks(
      {required this.averageFeedbackRate,
      required this.totalFeedback,
      required this.satisfactionRate,
      required this.feedbacks,
      required this.totalByStar});
  num averageFeedbackRate;
  int totalFeedback;
  // int totalByMedia;
  // int totalByComment;
  int satisfactionRate;
  List feedbacks;
  List<FeedBackByStar> totalByStar;

  factory Feedbacks.fromMap(Map<String, dynamic> json) => Feedbacks(
      averageFeedbackRate: json['averageFeedbackRate'] ?? 0,
      totalFeedback: json['totalFeedback'] ?? 0,
      satisfactionRate: json['satisfactionRate'] ?? 0,
      feedbacks: json['feedbacks'],
      totalByStar: List<FeedBackByStar>.from(
          json['totalByStar'].map((item) => FeedBackByStar.fromMap(item))));
}

class FeedBackByStar {
  FeedBackByStar({required this.voteStar, required this.total});
  int voteStar;
  int total;
  factory FeedBackByStar.fromMap(Map<String, dynamic> json) =>
      FeedBackByStar(voteStar: json['vote_star'], total: random.nextInt(255));
}

Random random = Random();
