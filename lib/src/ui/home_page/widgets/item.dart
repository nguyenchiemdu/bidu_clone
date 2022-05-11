import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/product_detail/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/cached_network_image.dart';
import '../../../../common/font.dart';
import '../../../../common/number_format.dart';
import '../../common_widget/discount.dart';

// Widget productItem(BuildContext context, Product product,
//         {int? top,
//         int? selled,
//         num? discountPercent,
//         bool isQuaranteed = false,
//         double marginLeft = 0,
//         double marginRight = 0,
//         double? containerWidth}) =>

class ProductItem extends StatelessWidget {
  const ProductItem(this.product,
      {this.top,
      this.selled,
      this.discountPercent,
      this.isQuaranteed = false,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.containerWidth,
      Key? key})
      : super(key: key);
  final Product product;
  final int? top;
  final int? selled;
  final num? discountPercent;
  final bool isQuaranteed;
  final double marginLeft;
  final double marginRight;
  final double? containerWidth;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        // decoration: const BoxDecoration(color: Colors.red),
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        width: containerWidth,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                SizedBox(
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: Colors.grey,
                  //         width: 1,
                  //         style: BorderStyle.solid)),
                  // width: 150,
                  // height: 150,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedImageCustom(
                      product.images[0],
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5.31,
                  right: 7.08,
                  child: Image.asset(
                    AssetLink.productMark,
                    width: 13.27,
                  ),
                ),
                top != null
                    ? Positioned(
                        left: 7,
                        bottom: 7,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color(0xff1A1A1A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: Text(
                              (top).toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: defaultFont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            isQuaranteed
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffFD374F))),
                    margin: const EdgeInsets.only(top: 7),
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    child: const Text(
                      'Đảm bảo',
                      style: TextStyle(
                          color: Color(0xffFD374F),
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w500,
                          fontSize: 6),
                    ),
                  )
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.only(top: 6),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: defaultFont,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Text(
                    priceFormat(product.salePrice),
                    style: const TextStyle(
                        fontFamily: defaultFont,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  const Text(
                    currency,
                    style: TextStyle(
                        fontFamily: defaultFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  discountPercent != null
                      ? dicount(discountPercent!, fontSize: 8)
                      : const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Image.asset(
                    AssetLink.location,
                    width: 7.08,
                  ),
                  const Text(
                    'Việt Nam',
                    style: TextStyle(
                        fontFamily: defaultFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  )
                ],
              ),
            ),
            selled != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Đã bán ' + (selled).toString(),
                      style: const TextStyle(
                          color: Color(0xff9A9A9A),
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  )
                : const SizedBox()
          ]),
        ),
      ),
    );
  }
}
