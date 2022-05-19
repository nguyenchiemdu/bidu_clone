// import 'dart:math';

// import 'package:bidu_clone/src/models/product.dart';

// ProductDetail productDetaiFromMap(Map<String, dynamic> json) {
//   return ProductDetail.fromMap(json);
// }

// class ProductDetail extends Product {
//   ProductDetail(
//       {required String id,
//       required String name,
//       required this.description,
//       required num salePrice,
//       required List<dynamic> images,
//       required num discountPercent,
//       required num beforeSalePrice,
//       required this.shop,
//       required this.timePrepareOrders,
//       required this.productBasicInfors,
//       required this.feedbacks})
//       : super(
//             id: id,
//             name: name,
//             salePrice: salePrice,
//             images: images,
//             discountPercent: discountPercent,
//             beforeSalePrice: beforeSalePrice);

  
//   factory ProductDetail.fromMap(Map<String, dynamic> json) {
//     // debugPrint(json['feedbacks'].toString());
//     return ProductDetail(
//         id: json['_id'],
//         name: json['name'],
//         description: json['description'],
//         salePrice: json['sale_price'] ?? 0,
//         beforeSalePrice: json['before_sale_price'] ?? 0,
//         images: json['images'],
//         discountPercent: json['discount_percent'],
//         shop: Shop.fromMap(json['shop']),
//         timePrepareOrders: List<PrepareOrder>.from(json['time_prepare_orders']
//             .map((prepareOrder) => PrepareOrder.fromMap(prepareOrder))),
//         productBasicInfors: List<ProductBasicInfor>.from(
//             json['product_detail_infos'].map((productBasicInfor) =>
//                 ProductBasicInfor.fromMap(productBasicInfor))),
//         feedbacks: Feedbacks.fromMap(json['feedbacks']));
//   }
// }


