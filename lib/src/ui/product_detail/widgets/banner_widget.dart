import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/ui/common_widget/banner_indicator.dart';
import 'package:bidu_clone/src/ui/product_detail/list_image_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  void _updateIndicator(BuildContext context) {
    if (_pageController.page == _pageController.page?.roundToDouble()) {
      // debugPrint(_pageController.page.toString());
      context
          .read<ProductDetailBloc>()
          .updateBannerIndicator(_pageController.page?.floor() ?? 0);
    }
  }

  void pushListImageFullscreen(
      BuildContext context, ProductDetailBloc productDetailBloc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => ListImageFullScreen(productDetailBloc))));
  }

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() => _updateIndicator(context));
    ProductDetailBloc productDetailBloc = context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: ((_, snapshot) {
          final List listImage = snapshot.data?.images ?? [];
          return GestureDetector(
            onTap: () => pushListImageFullscreen(context, productDetailBloc),
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  SizedBox(
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: listImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(0),
                            child: SizedBox(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedImageCustom(
                                  listImage[index],
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  BannerIndicator(
                      productDetailBloc.bannerIndicatorStream, listImage),
                  Positioned(
                    bottom: 16,
                    right: 23,
                    child: SizedBox(
                      width: 20,
                      child: Image.asset(AssetLink.fullScreenIcon),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
