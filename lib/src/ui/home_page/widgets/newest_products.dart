import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';

class NewestProducts extends StatelessWidget {
  const NewestProducts({Key? key}) : super(key: key);
  Widget headLine() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sản Phẩm Mới Nhất',
            style: TextStyle(
                fontSize: 18,
                fontFamily: defaultFont,
                fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              const Text(
                'Xem thêm',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: defaultFont,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  AssetLink.seeMoreArrow,
                  width: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: Provider.of<HomeBloc>(context).newestProductStream,
        builder: ((_, snapshot) {
          final List<Product> newestProducts;
          newestProducts = snapshot.data ?? [];
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 24),
            child: Column(children: [
              headLine(),
              //TODO: han che dung toan tu ba ngoi
              !snapshot.hasData && !snapshot.hasError
                  ? const Text('Loading')
                  : snapshot.hasError
                      ? const Text('Loi roi ban oi')
                      : Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 236,
                          child: ListView.builder(
                              itemCount: newestProducts.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                // print(newestProducts[index]);
                                // print(newestProducts[index]['images'][0]);
                                return ProductItem(newestProducts[index],
                                    selled: 300,
                                    discountPercent:
                                        newestProducts[index].discountPercent,
                                    marginLeft: index == 0 ? 16 : 0,
                                    marginRight: 8,
                                    containerWidth: 150);
                              })),
                        )
            ]),
          );
        }));
  }
}
