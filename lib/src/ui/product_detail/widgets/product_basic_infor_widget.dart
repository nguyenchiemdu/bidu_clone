import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_infor_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';
import '../../../models/product.dart';

class ProductBasicInforWidget extends StatelessWidget {
  ProductBasicInforWidget(this.productBasicInfors, {Key? key})
      : super(key: key) {
    productBasicInforWidgets =
        productBasicInfors.map((item) => ProductInforItem(item)).toList();
  }
  final List<ProductBasicInfor> productBasicInfors;
  late final List<Widget> productBasicInforWidgets;

  @override
  Widget build(BuildContext context) {
    ProductDetailBloc productDetailBloc = context.read<ProductDetailBloc>();
    return StreamBuilder<bool>(
        initialData: productDetailBloc.isProductBasicInforSeemore,
        stream: productDetailBloc.productBasicInforStream,
        builder: (_, isShowedMoreSnap) {
          bool? isShowedMore = isShowedMoreSnap.data!;
          String arrowButton = AssetLink.seeMore;
          List<Widget> basicInforWidgets = productBasicInforWidgets;
          if (isShowedMore == false) {
            arrowButton = AssetLink.collapse;
            basicInforWidgets = [];
          }
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  productDetailBloc
                      .changeProductBasicInforDisplayingStatus(!isShowedMore);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: const Text(
                          AppString.productBasicInfor,
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 8, child: Image.asset(arrowButton))
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(
                    top: basicInforWidgets.isNotEmpty ? 11 : 0,
                    bottom: basicInforWidgets.isNotEmpty ? 16 : 0),
                padding:
                    EdgeInsets.only(left: basicInforWidgets.isNotEmpty ? 4 : 0),
                child: AnimatedSize(
                  curve: Curves.bounceInOut,
                  duration: const Duration(milliseconds: 300),
                  child: Column(children: [...basicInforWidgets]),
                ),
              )
            ],
          );
        });
  }
}
