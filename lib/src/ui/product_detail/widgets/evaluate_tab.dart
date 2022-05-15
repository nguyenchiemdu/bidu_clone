import 'dart:math';

import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import 'comment_item.dart';
import 'images_view.dart';

class EvaluateTab extends StatelessWidget {
  const EvaluateTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // fake data because api died
    Random random = Random();
    List<Map> ratings = [];
    for (int i = 5; i >= 1; i--) {
      Map rating = {'rate': i, 'number': random.nextInt(255)};
      ratings.add(rating);
    }
    // fake data because api died

    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: (_, productSnap) {
          List<String> images =
              productSnap.data!.images.map((item) => item.toString()).toList();
          return Container(
            color: DesignColor.backgroundColor,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 20, left: 16, right: 16, bottom: 22),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '92% hài lòng với sản phẩm',
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 7.01),
                              child: Text(
                                'Xem tất cả đánh giá',
                                style: TextStyle(
                                    fontFamily: defaultFont,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: DesignColor.gradientPrimary1),
                              ),
                            ),
                            SizedBox(
                                width: 3.13,
                                child: Image.asset(AssetLink.arrowRight))
                          ],
                        ),
                      ],
                    ),
                    ImagesView(images),
                    GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 20),
                        childAspectRatio: 110 / 27,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        children: ratings
                            .map((rate) =>
                                RatingItem(rate['rate'], rate['number']))
                            .toList())
                  ]),
                ),
                CommentItem(),
                Container(
                  color: Colors.blue,
                  height: 1000,
                )
              ],
            ),
          );
        });
  }
}
