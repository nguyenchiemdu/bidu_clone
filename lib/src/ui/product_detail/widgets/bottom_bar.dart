import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/colors.dart';

const bottomBarHeight = 84.0;

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: bottomBarHeight,
        color: textBlackColor,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    // debugPrint('tapped');
                  },
                  child: Container(
                    height: bottomBarHeight,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(addToCart),
                        const Text(
                          'Thêm vào giỏ',
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: textWhite),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
              width: 1,
              height: 28,
              color: progressGray,
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    // debugPrint('tapped');
                  },
                  child: Container(
                    height: bottomBarHeight,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        'Mua Ngay',
                        style: TextStyle(
                            fontFamily: defaultFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
