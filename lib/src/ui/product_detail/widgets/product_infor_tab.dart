import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_basic_infor_widget.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../blocs/product_detail_bloc.dart';
import '../../../models/product_detail.dart';
import 'laundry_instruction.dart';
import 'product_description.dart';

String longText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
          Product? product = productSnapshot.data;
          late List<ProductBasicInfor> productBasicInfors;
          late String description;
          late List<String> imagesLink;
          if (product is ProductDetail) {
            productBasicInfors = product.productBasicInfors;
            description = product.description;
            imagesLink = product.images.map((item) => item.toString()).toList();
          } else {
            productBasicInfors = [];
            description = 'loading';
            imagesLink = [];
          }
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20.05),
                  child: Image.asset(AssetLink.freeshipBanner)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  ProductDescription(description, imagesLink),
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
