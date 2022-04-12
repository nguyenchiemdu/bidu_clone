import 'package:bidu_clone/src/blocs/newest_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../resources/api.dart';

class NewestProducts extends StatelessWidget {
  NewestProducts({Key? key}) : super(key: key);
  final NewestProductBloc newestProductBloc = NewestProductBloc();
  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat('###,###,##0.##');
    Api.getListNewestProducts().then(newestProductBloc.updateChange);
    return StreamBuilder<List?>(
        stream: newestProductBloc.newestProductsStream,
        builder: ((context, snapshot) {
          List newestProducts = snapshot.data ?? [];
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sản Phẩm Mới Nhất',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Xem thêm',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/icons/arrow.png',
                          width: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 236,
                child: ListView.builder(
                    itemCount: newestProducts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      // print(newestProducts[index]);
                      // print(newestProducts[index]['images'][0]);
                      return Container(
                        padding: const EdgeInsets.only(right: 8),
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    width: 150,
                                    height: 150,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        newestProducts[index]['images'][0],
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
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  newestProducts[index]['name'],
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
                                    priceFormat.format(newestProducts[index]
                                            ['sale_price'] ??
                                        0),
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
        }));
  }
}
