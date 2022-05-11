import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/colors.dart';
import '../../../screen_size.dart';

class FeedBackItem extends StatelessWidget {
  FeedBackItem({Key? key}) : super(key: key);

  static const designWidth = 202;
  static const designScreenWidth = 375;
  final itemWidth = Screen.width * designWidth / designScreenWidth;
  @override
  Widget build(BuildContext context) {
    //TODO: han che dung funtion DOING
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: DesignColor.gradientBlack.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          )
        ],
      ),
      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
      padding: const EdgeInsets.all(10),
      width: itemWidth,
      child: Row(children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            AssetLink.feedback,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hài lòng',
                style: TextStyle(
                    fontFamily: defaultFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Chất lượng sản phẩm tuyệt vời',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: defaultFont,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: DesignColor.textGrayColor),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
