import 'package:flutter/material.dart';

import '../../../common/font.dart';

Widget dicount(num discountPercent, {double? fontSize}) {
  return Container(
    // width: 24,
    // height: 10,
    margin: const EdgeInsets.only(left: 8),
    padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2, right: 4),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffFF7C79),
            Color(0xffE812A4),
          ]),
    ),
    child: Text(
      discountPercent.toString() + '%',
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.white,
          fontFamily: defaultFont,
          fontSize: fontSize,
          fontWeight: FontWeight.w700),
    ),
  );
}
