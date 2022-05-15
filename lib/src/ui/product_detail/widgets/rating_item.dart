import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem(this.rate, this.number, {Key? key}) : super(key: key);
  final int rate;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: DesignColor.backgroundColor)),
      padding: const EdgeInsets.only(left: 11.71, right: 7),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        RatingIconsOnly(rate),
        Container(
          width: 24,
          height: 13,
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: DesignColor.textBlackColor),
          ),
        )
      ]),
    );
  }
}

class RatingIconsOnly extends StatelessWidget {
  RatingIconsOnly(this.rate, {Key? key}) : super(key: key) {
    heartWidgets = [
      heartNofill,
      heartNofill,
      heartNofill,
      heartNofill,
      heartNofill
    ];
    for (int i = 0; i < rate; i++) {
      heartWidgets[i] = heartFilled;
    }
  }
  final HeartIcon heartFilled = HeartIcon(AssetLink.heartFilled);
  final HeartIcon heartNofill = HeartIcon(AssetLink.heartNofill);
  final int rate;
  late final List<Widget> heartWidgets;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: heartWidgets,
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon(this.link, {Key? key}) : super(key: key);
  final String link;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3.3),
      // height: ,
      width: 9.22,
      child: Image.asset(link),
    );
  }
}
