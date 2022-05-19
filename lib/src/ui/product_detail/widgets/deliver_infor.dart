import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_preparation_progress.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/shipping_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/colors.dart';
import '../../../models/product.dart';

class DeliverInfor extends StatelessWidget {
  const DeliverInfor({Key? key}) : super(key: key);
  List<ShippingMethodWidget> getShippingMethodWidgets(
      List<ShippingMethod> shippingMethods) {
    return shippingMethods
        .map((shippingMethod) => ShippingMethodWidget(shippingMethod))
        .toList();
  }

  List<ProductPreparationProgress> getProductPreparationProgresses(
      List<PrepareOrder> timePrepareOrders) {
    return timePrepareOrders.map((prepareOrder) {
      return ProductPreparationProgress(prepareOrder);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: (_, productSnapshot) {
          Product product;
          if (!productSnapshot.hasError) {
            product = productSnapshot.data!;
          } else {
            product = productDetailBloc.product;
          }
          late List<ShippingMethod> shippingMethods;
          late AvgShippingTime avgShippingTime;
          late List<PrepareOrder> timePrepareOrders;
          late String country;
          shippingMethods = product.shop?.shippingMethod ?? [];
          avgShippingTime =
              product.shop?.avgShippingTime ?? AvgShippingTime(min: 0, max: 0);
          timePrepareOrders = product.timePrepareOrders ?? [];
          country = ProductDetailBloc.getCountryText(product);
          final List<ShippingMethodWidget> shippingMethodWidgets =
              getShippingMethodWidgets(shippingMethods);
          final List<ProductPreparationProgress>
              productPreparationProgressWidget =
              getProductPreparationProgresses(timePrepareOrders);
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 4),
            padding:
                const EdgeInsets.only(top: 24, bottom: 14, left: 16, right: 15),
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
                            AppString.deliverInfor,
                            style: TextStyle(
                                fontFamily: defaultFont,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: DesignColor.textBlackColor),
                          ),
                        ),
                        ...shippingMethodWidgets
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            AppString.deliverTime,
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
                              child: Text(AppString.overall,
                                  style: TextStyle(
                                      fontFamily: defaultFont,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: DesignColor.textBlackColor)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                  ' ${avgShippingTime.min}-${avgShippingTime.max} ${AppString.day}',
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
                            SizedBox(
                                width: 9.92,
                                child: Image.asset(AssetLink.location)),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.04),
                              child: Text(country),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(AppString.productPreparationTime),
                        margin: const EdgeInsets.only(bottom: 10),
                      ),
                      ...productPreparationProgressWidget
                    ]),
              )
            ]),
          );
        });
  }
}
