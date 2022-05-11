import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';

class ProductPreparationProgress extends StatelessWidget {
  const ProductPreparationProgress(
      this.duration, this.progress, this.isColorful,
      {Key? key})
      : super(key: key);
  final double progress;
  final String duration;
  final bool isColorful;
  // dung bien thay vi 1 ham;
  double getProgressBarWidth() {
    double designWitdh = 254;
    double designScreenWidth = 375;
    return Screen.width * designWitdh / designScreenWidth;
  }

  Widget percentDone() {
    //TODO: han che dung 3 ngoi
    BoxDecoration boxDecoration = isColorful
        ? BoxDecoration(
            gradient: LinearGradient(colors: [
              DesignColor.gradientPrimary2,
              DesignColor.gradientPrimary1
            ]),
            borderRadius: const BorderRadius.all(Radius.circular(10)))
        : BoxDecoration(
            color: DesignColor.progressGray,
            borderRadius: const BorderRadius.all(Radius.circular(10)));
    return Container(
      width: progress / 100 * getProgressBarWidth(),
      height: 8,
      decoration: boxDecoration,
    );
  }

  // TODO: dung final textstyle; dung 1 bien thay vi dung ham;
  TextStyle textStyle() {
    Color color =
        isColorful ? DesignColor.primaryColor : DesignColor.textProgressGray;
    return TextStyle(
        fontFamily: defaultFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color);
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
              style: textStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: getProgressBarWidth(),
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
