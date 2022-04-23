import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

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
                Text('Thời gian vận chuyển'),
                Row(
                  children: [Text('Trung bình'), Text('1-3 ngày')],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/location.png'),
                    Text('Hàn Quốc')
                  ],
                )
              ],
            ),
          ],
        ),
        Container(
          child: Column(children: [
            Text('Thời gian chuẩn bị hàng'),
            Row(
              children: [
                Container(
                  child: Text('1 ngày'),
                ),
                Container(
                  width: Screen.width * 254 / 375,
                  child: Stack(children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                          color: Color(0xffF1F1F1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      width: 239,
                      height: 8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffFF7C79), Color(0xffE812A4)]),
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
