import 'package:bidu_clone/common/asset_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../blocs/product_detail_bloc.dart';

//TODO: dung sliver appbar , nhung chua lam animation thay doi mau duoc
class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Color>(
        initialData: productDetailBloc.appBarColor,
        stream: productDetailBloc.appbarColorStream,
        builder: (_, appBarColorSnap) {
          return SliverAppBar(
              pinned: true,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              backgroundColor: appBarColorSnap.data,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              // remove bottom shadow
              elevation: 0,
              leadingWidth: 40,
              leading: Container(
                padding: const EdgeInsets.only(left: 8),
                child: SvgPicture.asset(
                  AssetLink.appBarBackButton,
                  width: 32,
                ),
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(AssetLink.appBarShareButton)),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(AssetLink.appBarCartButton)),
              ]);
        });
  }
}
