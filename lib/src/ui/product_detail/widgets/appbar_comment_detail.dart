import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/asset_link.dart';

AppBar appBarCommentDetailWidget() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    leadingWidth: 27,
    leading: Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 18),
      child: Image.asset(
        AssetLink.backIcon,
        // width: 9,
      ),
    ),
    title: Container(
      // margin: const EdgeInsets.only(left: ),
      alignment: Alignment.centerLeft,
      child: Text(
        'Đánh giá',
        style: TextStyle(
            fontFamily: defaultFont,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: DesignColor.textBlackColor),
      ),
    ),
  );
}
