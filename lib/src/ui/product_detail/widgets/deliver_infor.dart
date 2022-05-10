import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/colors.dart';

class DeliverInfor extends StatelessWidget {
  const DeliverInfor({Key? key}) : super(key: key);
  Widget deliverOption(
      {String branch = 'GHTK', int startPrice = 30, int endPrice = 60}) {
    return Row(
      children: [Text(branch), Text('đ $startPrice ~ đ $endPrice')],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Row(
          children: [
            Column(
              children: [
                const Text('Thông tin giao hàng'),
                deliverOption(),
                deliverOption(),
              ],
            ),
            Column(
              children: [
                const Text('Thời gian vận chuyển'),
                Row(
                  children: const [Text('Trung bình'), Text('1-3 ngày')],
                ),
                Row(
                  children: [Image.asset(location), const Text('Hàn Quốc')],
                )
              ],
            ),
          ],
        ),
        SizedBox(
          child: Column(children: [
            const Text('Thời gian chuẩn bị hàng'),
            Row(
              children: [
                const SizedBox(
                  child: Text('1 ngày'),
                ),
                SizedBox(
                  width: Screen.width * 254 / 375,
                  child: Stack(children: [
                    Container(
                      height: 8,
                      decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      width: 239,
                      height: 8,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [gradientPrimary2, gradientPrimary1]),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )
                  ]),
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}
