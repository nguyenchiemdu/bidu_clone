import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/font.dart';
import '../../common_widget/discount.dart';

class ProductInfor extends StatelessWidget {
  const ProductInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Product>(
        //TODO : thu hoi stream done
        initialData: context.read<ProductDetailBloc>().product,
        stream: Provider.of<ProductDetailBloc>(context).productStream,
        builder: (context, snapshot) {
          final Product? product = snapshot.data;
          return Container(
            padding: const EdgeInsets.only(top: 8),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 253,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product?.name ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontFamily: defaultFont,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 16),
                                        width: 13.27,
                                        child: SvgPicture.asset(
                                            'assets/icons/mark.svg'))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    priceFormat(product?.salePrice ?? 0),
                                    style: const TextStyle(
                                        fontFamily: defaultFont,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    ' ₫',
                                    style: TextStyle(
                                        fontFamily: defaultFont,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(right: 5.5),
                                      child: dicount(
                                          product?.discountPercent ?? 0,
                                          fontSize: 12)),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff9A9A9A))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    child: const Text(
                                      'New',
                                      style: TextStyle(
                                          fontFamily: defaultFont,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                priceFormat(product?.beforeSalePrice ?? 0) +
                                    '₫',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xff9A9A9A),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset(
                                            'assets/icons/information_product.png')),
                                    Container(
                                        margin: const EdgeInsets.only(left: 7),
                                        child: const Text(
                                          'Đổi trả trong vòng 3 ngày',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontFamily: defaultFont,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFD37AE)),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffFD37AE))),
                                margin: const EdgeInsets.only(top: 24),
                                padding: const EdgeInsets.only(
                                    left: 20, right: 17, top: 10, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Nhập mã khuyến mãi giảm giá tối đa 200k',
                                      style: TextStyle(
                                          fontFamily: defaultFont,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xffFD37AE)),
                                    ),
                                    SizedBox(
                                        width: 8,
                                        child: Image.asset(
                                            'assets/icons/see_more.png'))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: 1,
                  color: const Color(0xffF1F1F1),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            '40 đánh giá',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 5),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  width: 10,
                                  child: Image.asset('assets/icons/heart.png')),
                              const Text(
                                '4.8 / 5.0',
                                style: TextStyle(
                                    fontFamily: defaultFont,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff9A9A9A)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          height: 90,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: ((context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.08),
                                        spreadRadius: 0,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 16 : 0,
                                      top: 5,
                                      bottom: 5,
                                      right: 10),
                                  padding: const EdgeInsets.all(10),
                                  width: Screen.width * 202 / 375,
                                  child: Row(children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        'assets/icons/feedback.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text('Hài lòng'),
                                        Text(
                                            'Chất lượng sản phẩm tuyệt vời,...')
                                      ],
                                    ))
                                  ]),
                                );
                              })),
                        )
                      ]),
                )
              ],
            ),
          );
        });
  }
}
