import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/ui/product_detail/comment_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import 'comment_item.dart';
import 'images_view.dart';
import 'rating_list.dart';

class EvaluateTab extends StatelessWidget {
  const EvaluateTab({Key? key}) : super(key: key);
  void pushCommentDetailScreen(
      BuildContext context, List<String> images, List<FeedBackByStar> ratings) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
          context,
        ) =>
                CommentDetailScreen(images, ratings)));
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: (_, productSnap) {
          List<String> images =
              productSnap.data!.images.map((item) => item.toString()).toList();
          List<FeedBackByStar> ratings;
          Product productDetail = productSnap.data!;
          ratings = productDetail.feedbacks?.totalByStar ?? [];
          // return SizedBox(
          //   height: 700,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 100),
          //     child: Column(children: [
          //       Image.asset(
          //         AssetLink.evaluate,
          //         width: 60,
          //       ),
          //       Text(
          //         'Chưa có đánh giá',
          //         style: TextStyle(
          //             fontFamily: defaultFont,
          //             fontWeight: FontWeight.w400,
          //             fontSize: 14,
          //             color: DesignColor.textGrayColor),
          //       )
          //     ]),
          //   ),
          // );
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
                          '92% ${AppString.satisfiedWithProduct}',
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () =>
                              pushCommentDetailScreen(context, images, ratings),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, left: 5),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 7.01),
                                  child: Text(
                                    AppString.seeAllReviews,
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
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ImagesView(images, 82, 4, 5)),
                    RatingList(ratings),
                  ]),
                ),
                CommentItem(images),
                CommentItem(images),
                CommentItem(images),
              ],
            ),
          );
        });
  }
}
