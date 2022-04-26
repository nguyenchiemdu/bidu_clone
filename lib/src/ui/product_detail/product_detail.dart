import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/banner_widget.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/deliver_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/shop_infor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/product_detail_bloc.dart';
import 'widgets/appbar.dart';

// TODO: (Trung) UI chưa hoàn chỉnh, còn lệch nhiều
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(this.productData, {Key? key}) : super(key: key);
  final Product productData;
  @override
  Widget build(BuildContext context) {
    return Provider<ProductDetailBloc>(
        create: (context) => ProductDetailBloc(productData),
        builder: (context, child) {
          return const _DetailPage();
        });
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: productDetailAppbar(),
      body: Container(
        color: const Color(0xffC9C9C9),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: const [
            BannerWidget(),
            ShopInFor(),
            ProductInfor(),
            DeliverInfor(),
          ]),
        ),
      ),
    );
  }
}
