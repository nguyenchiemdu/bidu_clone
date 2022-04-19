import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';

class DeliverInfor extends StatelessWidget {
  const DeliverInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Column(
              children: [
                Text('Thông tin giao hàng'),
                Row(
                  children: [Text('GHTK'), Text('đ 30k ~ đ 60k')],
                ),
                Row(
                  children: [Text('J&T'), Text('đ 30k ~ đ 60k')],
                )
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
