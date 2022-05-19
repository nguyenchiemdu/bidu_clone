import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/asset_link.dart';
import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import 'package:flutter_svg/svg.dart';

const kAvatarSize = 36.0;

class ShopInFor extends StatelessWidget {
  const ShopInFor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductDetailBloc productDetailBloc = context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: (_, snapshot) {
          Product? product = snapshot.data;
          String shopName = product?.shop?.name ?? AppString.loading;
          double shopRating = product?.shop?.shopRating ?? 0;
          int chatResponseByPercent = product?.shop?.chatResponseByPercent ?? 0;
          DecorationImage decorationImage;
          if (product?.shop?.avatarLink != null) {
            decorationImage =
                DecorationImage(image: NetworkImage(product!.shop!.avatarLink));
          } else {
            decorationImage =
                DecorationImage(image: AssetImage(AssetLink.shopAvatar));
          }
          Widget avatarWidget = Container(
            width: kAvatarSize,
            height: kAvatarSize,
            decoration:
                BoxDecoration(shape: BoxShape.circle, image: decorationImage),
          );
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      avatarWidget,
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shopName,
                              style: const TextStyle(
                                  fontFamily: defaultFont,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 9),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 14,
                                      child: Image.asset(AssetLink.number1)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      shopRating.rateFormat(),
                                      style: const TextStyle(
                                          fontFamily: defaultFont,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 10,
                                    color: DesignColor.backgroundGray,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '${AppString.chatResponseRate} $chatResponseByPercent%',
                                      style: const TextStyle(
                                          fontFamily: defaultFont,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(children: [
                      SizedBox(
                        height: 14,
                        child: SvgPicture.asset(
                          AssetLink.navHeart,
                          color: DesignColor.primaryColor,
                        ),
                      ),
                      Text(
                        '2.3k',
                        style: TextStyle(
                            color: DesignColor.primaryColor,
                            fontFamily: defaultFont,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ]),
                  )
                ]),
          );
        });
  }
}
