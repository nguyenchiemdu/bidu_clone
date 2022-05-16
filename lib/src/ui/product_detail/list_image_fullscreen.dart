import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/cached_network_image.dart';
import 'widgets/banner_widget.dart';

class ListImageFullScreen extends StatelessWidget {
  const ListImageFullScreen(this.productDetailBloc, {Key? key})
      : super(key: key);
  final ProductDetailBloc productDetailBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Provider<ProductDetailBloc>(
          create: (context) => productDetailBloc,
          child: const _ListImages(),
        ),
      ),
    );
  }
}

class _ListImages extends StatelessWidget {
  const _ListImages({Key? key}) : super(key: key);
// final PageController _pageController = PageController();
  // void _updateIndicator(BuildContext context) {
  //   if (_pageController.page == _pageController.page?.roundToDouble()) {
  //     // debugPrint(_pageController.page.toString());
  //     context
  //         .read<ProductDetailBloc>()
  //         .updateBannerIndicator(_pageController.page?.floor() ?? 0);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final List listImage = context.read<ProductDetailBloc>().product.images;
    // _pageController.addListener(() => _updateIndicator(context));
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          SizedBox(
            child: PageView.builder(
                // controller: _pageController,
                itemCount: listImage.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(0),
                    child: SizedBox(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CachedImageCustom(
                          listImage[index],
                          // boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          // BannerIndicator(productDetailBloc.bannerIndicatorStream, listImage)
        ],
      ),
    );
  }
}
