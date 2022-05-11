import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';

class ProductPreparationProgress extends StatelessWidget {
  ProductPreparationProgress(this.duration, this.progress, this.isColorful,
      {Key? key})
      : super(key: key) {
    if (isColorful) {
      color = DesignColor.primaryColor;
      boxDecoration = BoxDecoration(
          gradient: LinearGradient(colors: [
            DesignColor.gradientPrimary2,
            DesignColor.gradientPrimary1
          ]),
          borderRadius: const BorderRadius.all(Radius.circular(10)));
    } else {
      color = DesignColor.textProgressGray;
      boxDecoration = BoxDecoration(
          color: DesignColor.progressGray,
          borderRadius: const BorderRadius.all(Radius.circular(10)));
    }
    textStyle = TextStyle(
        fontFamily: defaultFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color);
  }
  final double progress;
  final String duration;
  final bool isColorful;
  static const designWidth = 254;
  static const designScreenWidth = 375;
  final progressBarWidth = Screen.width * designWidth / designScreenWidth;
  late final Color color;
  late final BoxDecoration boxDecoration;
  late final TextStyle textStyle;
  Widget percentDone() {
    return Container(
      width: progress / 100 * progressBarWidth,
      height: 8,
      decoration: boxDecoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              duration,
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: progressBarWidth,
            child: Stack(children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                    color: DesignColor.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              percentDone(),
            ]),
          )
        ],
      ),
    );
  }
}
