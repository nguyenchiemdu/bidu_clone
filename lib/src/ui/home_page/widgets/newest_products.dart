import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/newest_product.dart';

class NewestProducts extends StatelessWidget {
  const NewestProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NewestProduct>>(
        stream: Provider.of<HomeBloc>(context).newestProductStream,
        builder: ((context, snapshot) {
          final List<NewestProduct> newestProducts;
          newestProducts = snapshot.data ?? [];
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 24),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
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
                      return productItem(newestProducts[index],
                          selled: 300,
                          discountPercent:
                              newestProducts[index].discountPercent,
                          marginLeft: index == 0 ? 16 : 0,
                          marginRight: 8);
                    })),
              )
            ]),
          );
        }));
  }
}
