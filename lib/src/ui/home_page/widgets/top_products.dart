import 'dart:math';

import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/blocs/home_state.dart';
import 'package:bidu_clone/src/models/top_product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TopProducts extends StatelessWidget {
  TopProducts({Key? key}) : super(key: key);
  final priceFormat = NumberFormat('###,###,##0.##');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
        stream: Provider.of<HomeBloc>(context).topProductStream,
        builder: (context, snapshot) {
          final List<TopProduct> topProducts;
          if (snapshot.data is TopProductLoaded) {
            topProducts = (snapshot.data as TopProductLoaded).listTopProduct;
          } else {
            topProducts = [];
          }
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.only(left: 16, top: 24),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Top Sản Phẩm',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 236,
                child: ListView.builder(
                    itemCount: min(topProducts.length, 5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      // print(topProducts[index]);
                      return Container(
                        padding: const EdgeInsets.only(right: 8),
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.grey,
                                    //         width: 1,
                                    //         style: BorderStyle.solid)),
                                    width: 150,
                                    height: 150,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        topProducts[index].images[0].toString(),
                                        fit: BoxFit.cover,
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
                                  Positioned(
                                    left: 7,
                                    bottom: 7,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff1A1A1A),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Center(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  topProducts[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    priceFormat
                                        .format(topProducts[index].salePrice),
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
                                  )
                                ],
                              ),
                              Row(
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
                              const Text(
                                'Đã bán 120',
                                style: TextStyle(
                                    color: Color(0xff9A9A9A),
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              )
                            ]),
                      );
                    })),
              )
            ]),
          );
        });
  }
}
