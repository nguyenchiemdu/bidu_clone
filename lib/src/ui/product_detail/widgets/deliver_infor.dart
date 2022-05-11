import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_preparation_progress.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/colors.dart';

class DeliverInfor extends StatelessWidget {
  const DeliverInfor({Key? key}) : super(key: key);
  Widget deliverOption(
      {String branch = 'GHTK', int startPrice = 30, int endPrice = 60}) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Text(branch,
              style: TextStyle(
                  fontFamily: defaultFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DesignColor.textBlackColor)),
        ),
        Text('$currency $startPrice ~ $currency $endPrice')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.only(top: 24, bottom: 14, left: 16, right: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Thông tin giao hàng',
                      style: TextStyle(
                          fontFamily: defaultFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: DesignColor.textBlackColor),
                    ),
                  ),
                  deliverOption(),
                  deliverOption(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Thời gian vận chuyển',
                      style: TextStyle(
                          fontFamily: defaultFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: DesignColor.textBlackColor),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        child: Text('Trung bình',
                            style: TextStyle(
                                fontFamily: defaultFont,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: DesignColor.textBlackColor)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        child: Text('1-3 ngày',
                            style: TextStyle(
                                fontFamily: defaultFont,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DesignColor.textBlackColor)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(AssetLink.location),
                      const Text('Hàn Quốc')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: const Text('Thời gian chuẩn bị hàng'),
              margin: const EdgeInsets.only(bottom: 10),
            ),
            const ProductPreparationProgress('1 ngày', 80, true),
            const ProductPreparationProgress('2 ngày', 80, false),
            const ProductPreparationProgress('3 ngày', 0, false),
            const ProductPreparationProgress('4 ngày', 0, false),
            const ProductPreparationProgress('Sau 4 ngày', 0, false)
          ]),
        )
      ]),
    );
  }
}
