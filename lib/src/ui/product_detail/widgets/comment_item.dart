import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/images_view.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CommentItem extends StatelessWidget {
  CommentItem(this.images, {Key? key}) : super(key: key) {
    productAttributeWidgets = productAttributes
        .map((attribute) => ProductAttribute(attribute))
        .toList();
  }
  final String image = AssetLink.shopAvatar;
  final String user = 'Juaen';
  final int rate = 4;
  final int liked = 3;
  final bool isLiked = true;
  final String time = '06-04-2021 11:36';
  final List<Map> productAttributes = [
    {'key': 'Loại hàng: ', 'value': 'Xanh / Freesize'},
    {'key': 'Chỉ số cơ thể: ', 'value': '155cm/45kg/size 44'},
  ];
  final List<String> images;
  final String comment =
      'Every spring I start going through dress withdrawals and go crazy over all the pretty spring dresses that come out haha.';
  late final List<ProductAttribute> productAttributeWidgets;
  @override
  Widget build(BuildContext context) {
    String likeImage = isLiked ? AssetLink.likeActive : AssetLink.like;
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 44.55,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(image))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13.37),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user,
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: DesignColor.textBlackColor),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 7.59),
                          child: Row(
                            children: [
                              RatingIconsOnly(rate),
                              Container(
                                margin: const EdgeInsets.only(left: 10.71),
                                child: Text(
                                  time,
                                  style: TextStyle(
                                      fontFamily: defaultFont,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      color: DesignColor.textGrayColor),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 14.66,
                    child: Image.asset(likeImage),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4.3),
                    child: Text(
                      liked.toString(),
                      style: TextStyle(
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: DesignColor.progressGray),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 11),
            child: Column(children: [
              ...productAttributeWidgets,
              TextComment(comment),
              Container(
                  margin: const EdgeInsets.only(top: 22),
                  child: ImagesView(images, 108, 3, 10))
            ]),
          )
        ],
      ),
    );
  }
}

class ProductAttribute extends StatelessWidget {
  const ProductAttribute(this.attribute, {Key? key}) : super(key: key);
  final Map attribute;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text(
            attribute['key'],
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: DesignColor.textGrayColor),
          ),
          Text(
            attribute['value'],
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: DesignColor.textBlackColor),
          )
        ],
      ),
    );
  }
}

class TextComment extends StatefulWidget {
  const TextComment(this.comment, {Key? key}) : super(key: key);
  final String comment;
  @override
  State<TextComment> createState() => _TextCommentState();
}

class _TextCommentState extends State<TextComment> {
  late final String comment = widget.comment;
  bool isSeemore = false;
  final minimunLine = 4;
  void seeMore() {
    if (!isSeemore) {
      setState(() {
        isSeemore = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      child: LayoutBuilder(builder: (context, size) {
        int? maxlines;
        if (!isSeemore) {
          maxlines = minimunLine;
        } else {
          maxlines = null;
        }
        final span = TextSpan(
            text: comment,
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: DesignColor.textBlackColor));
        final tp = TextPainter(
            text: span,
            maxLines: maxlines,
            textDirection: ui.TextDirection.rtl);
        tp.layout(maxWidth: size.maxWidth);

        if (tp.didExceedMaxLines) {
          // The text has more than  minimunLine.
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment,
                  maxLines: minimunLine,
                  style: TextStyle(
                      fontFamily: defaultFont,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: DesignColor.textBlackColor)),
              GestureDetector(
                onTap: seeMore,
                child: Text('See more',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: defaultFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: DesignColor.textBlackColor)),
              )
            ],
          );
        } else {
          return Text(comment,
              style: TextStyle(
                  fontFamily: defaultFont,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: DesignColor.textBlackColor));
        }
      }),
    );
  }
}
