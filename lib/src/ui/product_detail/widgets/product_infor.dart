import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductInfor extends StatelessWidget {
  const ProductInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Product>(
        initialData: Provider.of<ProductDetailBloc>(context).product,
        stream: Provider.of<ProductDetailBloc>(context).productStream,
        builder: (context, snapshot) {
          final Product? product = snapshot.data;
          return Container(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 253,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product?.name ?? '',
                              style: const TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                                width: 13.27,
                                child:
                                    SvgPicture.asset('assets/icons/mark.svg'))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            product?.salePrice.toString() ?? '',
                            style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '₫',
                            style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            child: Text(
                                (product?.discountPercent.toString() ?? '') +
                                    '%'),
                          ),
                          Container(
                            child: Text('New'),
                          ),
                        ],
                      ),
                      Text(product?.beforeSalePrice.toString() ?? ''),
                      Row(
                        children: [
                          Image.asset('assets/icons/information_product.png'),
                          Text('Đổi trả trong vòng 3 ngày')
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text('Nhập mã khuyến mãi giảm giá tối đa 200k'),
                            Image.asset('assets/icons/see_more.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(0xffF1F1F1),
                ),
                Container(
                  child: Column(children: [
                    Text('40 đánh giá'),
                    Row(
                      children: [
                        SizedBox(
                            width: 10,
                            child: Image.asset('assets/icons/heart.png')),
                        Text('4.8 / 5.0'),
                      ],
                    ),
                    Container(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: ((context, index) {
                            return Container(
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
                                    Text('Chất lượng sản phẩm tuyệt vời,...')
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
