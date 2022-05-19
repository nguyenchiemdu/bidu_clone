import 'package:bidu_clone/common/font.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';

class ProductInforItem extends StatelessWidget {
  const ProductInforItem(this.productBasicInfor, {Key? key}) : super(key: key);
  final ProductBasicInfor productBasicInfor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '${productBasicInfor.name}   ',
            style: const TextStyle(
                fontFamily: defaultFont,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Text(
            productBasicInfor.value,
            style: const TextStyle(
                fontFamily: defaultFont,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
