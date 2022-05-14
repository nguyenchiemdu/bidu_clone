import 'package:bidu_clone/src/models/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import '../../../../common/number_format.dart';

const startPrice = 30;
const endPrice = 60;

class ShippingMethodWidget extends StatelessWidget {
  const ShippingMethodWidget(this.shippingMethod, {Key? key}) : super(key: key);
  final ShippingMethod shippingMethod;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Text(shippingMethod.name,
              style: TextStyle(
                  fontFamily: defaultFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DesignColor.textBlackColor)),
        ),
        const Text('$currency $startPrice ~ $currency $endPrice')
      ],
    );
  }
}
