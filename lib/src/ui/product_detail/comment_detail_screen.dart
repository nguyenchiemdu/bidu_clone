import 'package:bidu_clone/src/ui/product_detail/widgets/appbar_comment_detail.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/rating_list.dart';
import 'package:flutter/material.dart';

import '../../../common/asset_link.dart';
import '../../../common/colors.dart';
import '../../../common/font.dart';
import '../../models/product_detail.dart';
import 'widgets/comment_item.dart';
import 'widgets/images_view.dart';

class CommentDetailScreen extends StatelessWidget {
  const CommentDetailScreen(this.images, this.ratings, {Key? key})
      : super(key: key);
  final List<String> images;
  final List<FeedBackByStar> ratings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommentDetailWidget(),
      body: SingleChildScrollView(
        child: Container(
          color: DesignColor.backgroundColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 38, left: 16, right: 16, bottom: 20),
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '40 đánh giá',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 4),
                                width: 10,
                                child: Image.asset(AssetLink.sellerHeart)),
                            Text(
                              '4.8 / 5.0',
                              style: TextStyle(
                                  fontFamily: defaultFont,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: DesignColor.textGrayColor),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: Text(
                          '92% hài lòng với sản phẩm',
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ImagesView(images, 82, 4, 5)),
                      RatingList(ratings)
                    ]),
              ),
              CommentItem(images),
              CommentItem(images),
              CommentItem(images),
            ],
          ),
        ),
      ),
    );
  }
}
