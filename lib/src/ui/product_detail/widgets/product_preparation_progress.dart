import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product_detail.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';

class ProductPreparationProgress extends StatelessWidget {
  ProductPreparationProgress(this.prepareOrder, {Key? key}) : super(key: key) {
    List responds = ProductDetailBloc.processPrepareOrder(prepareOrder);
    duration = responds[0];
    isColorful = responds[1];
    // temporary because data is always 0
    progress = prepareOrder.value == 0 ? 30 : prepareOrder.value;
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
  final PrepareOrder prepareOrder;
  late final double progress;
  late final String duration;
  late final bool isColorful;
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
