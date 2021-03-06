import 'dart:math';

import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/top_product.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TopProduct>>(
        stream: Provider.of<HomeBloc>(context).topProductStream,
        builder: (context, snapshot) {
          final List<TopProduct> topProducts;
          topProducts = snapshot.data ?? [];
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.only(top: 24),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Row(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 240,
                child: ListView.builder(
                    itemCount: min(topProducts.length, 5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      // print(topProducts[index]);
                      return productItem(topProducts[index],
                          top: index + 1,
                          selled: 120,
                          marginLeft: index == 0 ? 16 : 0,
                          marginRight: 8);
                    })),
              )
            ]),
          );
        });
  }
}
