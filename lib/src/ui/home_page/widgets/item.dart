import 'package:bidu_clone/src/ui/product_detail/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../../common/number_format.dart';

Widget productItem(BuildContext context, product,
        {int? top,
        int? selled,
        num? discountPercent,
        bool isQuaranteed = false,
        double marginLeft = 0,
        double marginRight = 0}) =>
    GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product))),
      child: Container(
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        width: 150,
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  child: Image.network(
                    product.images[0].toString(),
                    fit: BoxFit.cover,
                    errorBuilder: (context, object, stackTrace) {
                      return Container(
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 5.31,
                right: 7.08,
                child: Image.asset(
                  'assets/icons/mark.png',
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            (top).toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
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
                        fontFamily: 'Lexend',
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
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Text(
                  priceFormnat(product.salePrice),
                  style: const TextStyle(
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                const Text(
                  ' ₫',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                discountPercent != null
                    ? Container(
                        width: 24,
                        height: 10,
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.only(left: 4),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xffFF7C79),
                                Color(0xffE812A4),
                              ]),
                        ),
                        child: Text(
                          discountPercent.toString() + '%',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lexend',
                              fontSize: 8,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/location.png',
                  width: 7.08,
                ),
                const Text(
                  'Việt Nam',
                  style: TextStyle(
                      fontFamily: 'Lexend',
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
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                )
              : const SizedBox()
        ]),
      ),
    );

class Item {}
