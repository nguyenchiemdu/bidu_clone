import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/feedback_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import '../../common_widget/discount.dart';

class ProductInfor extends StatelessWidget {
  const ProductInfor({Key? key}) : super(key: key);
  Widget productTitle(String? productName) {
    productName ??= '';
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              productName,
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
              child: SvgPicture.asset(AssetLink.productMarkDetail))
        ],
      ),
    );
  }

  Widget productPriceAndSalePercent(Product? product) {
    num salePrice = product?.salePrice ?? 0;
    num discount = product?.discountPercent ?? 0;
    return Row(
      children: [
        Text(
          priceFormat(salePrice),
          style: const TextStyle(
              fontFamily: defaultFont,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const Text(
          currency,
          style: TextStyle(
              fontFamily: defaultFont,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        Container(
            margin: const EdgeInsets.only(right: 5.5),
            child: dicount(discount, fontSize: 12)),
        Container(
          decoration: BoxDecoration(border: Border.all(color: textGrayColor)),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: const Text(
            'New',
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget beforeSalePrice(num? beforeSalePrice) {
    beforeSalePrice ??= 0;
    return Text(
      priceFormat(beforeSalePrice) + '₫',
      style: const TextStyle(
          decoration: TextDecoration.lineThrough,
          color: textGrayColor,
          fontWeight: FontWeight.w400,
          fontSize: 14),
    );
  }

  Widget returnProduct() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          SizedBox(
              width: 16,
              height: 16,
              child: Image.asset(AssetLink.inforProductIcon)),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text(
                'Đổi trả trong vòng 3 ngày',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: defaultFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
              ))
        ],
      ),
    );
  }

  Widget addCoupon() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: primaryColor)),
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 20, right: 17, top: 10, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Nhập mã khuyến mãi giảm giá tối đa 200k',
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: primaryColor),
          ),
          SizedBox(width: 8, child: Image.asset(AssetLink.seeMore))
        ],
      ),
    );
  }

  Widget feedBack() {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  child: Image.asset(AssetLink.sellerHeart)),
              const Text(
                '4.8 / 5.0',
                style: TextStyle(
                    fontFamily: defaultFont,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: textGrayColor),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 24, top: 14),
          height: 78,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: ((_, index) {
                return FeedBackItem(index);
              })),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Product>(
        initialData: context.read<ProductDetailBloc>().product,
        stream: Provider.of<ProductDetailBloc>(context).productStream,
        builder: (_, snapshot) {
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
                              productTitle(product?.name),
                              productPriceAndSalePercent(product),
                              beforeSalePrice(product?.beforeSalePrice),
                              returnProduct(),
                              addCoupon(),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: 1,
                  color: backgroundColor,
                ),
                feedBack()
              ],
            ),
          );
        });
  }
}
