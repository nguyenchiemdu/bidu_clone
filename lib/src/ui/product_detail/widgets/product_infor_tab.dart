import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_basic_infor_widget.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../blocs/product_detail_bloc.dart';
import 'laundry_instruction.dart';
import 'product_description.dart';

class ProductInforTab extends StatelessWidget {
  const ProductInforTab({Key? key}) : super(key: key);
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
          List<ProductBasicInfor> productBasicInfors =
              product.productBasicInfors ?? [];
          String description = product.description ?? AppString.loading;
          List<String> imagesLink =
              product.images.map((item) => item.toString()).toList();
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20.05),
                  child: Image.asset(AssetLink.freeshipBanner)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  ProductDescription(
                    description,
                    imagesLink,
                  ),
                  Container(
                    height: 1,
                    color: DesignColor.progressGray,
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  ProductBasicInforWidget(productBasicInfors),
                  Container(
                    height: 1,
                    color: DesignColor.progressGray,
                  ),
                  LaundryInstruction(),
                  Container(
                    height: 1,
                    color: DesignColor.progressGray,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 24),
                      child: const SuggestionProductDetail()),
                ]),
              ),
              // Container(
              //   color: Colors.blue,
              //   height: 1000,
              // )
            ],
          );
        });
  }
}
