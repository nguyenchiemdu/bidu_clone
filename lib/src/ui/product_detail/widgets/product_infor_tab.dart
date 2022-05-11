import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';

class ProductInforTab extends StatelessWidget {
  const ProductInforTab({Key? key}) : super(key: key);
  Widget title(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: defaultFont,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
    );
  }

  Widget content(String content) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        content,
        style: const TextStyle(
            fontFamily: defaultFont,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 20.05),
            child: Image.asset(freeshipBanner)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              title('Mô tả sản phẩm'),
              content(
                  '[Rẻ Vô Địch] Áo Sơ Mi Đũi 1 Túi Dáng Rộng Ullzang Hàn Quốc sẵn kho sll đủ màu tại shop nhé, chất đũi không nhăn freesize <60kg đổ về '),
              title('Màu sắc'),
              content('có 3 màu: cam, xanh và trắng'),
              Container(
                height: 1000,
              )
            ],
          ),
        )
      ],
    );
  }
}
