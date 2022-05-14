import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';
import '../../../screen_size.dart';
import 'product_images.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription(this.description, this.imagesLink, {Key? key})
      : super(key: key);
  final String description;
  final List<String> imagesLink;
  final GlobalKey _widgetKey = GlobalKey();

  Widget title(String title, {double marginTop = 24, double marginBottom = 0}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: defaultFont,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
    );
  }

  Widget content(String content) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: defaultFont,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
    );
  }

  void onProductDescriptionHeightChange(ProductDetailBloc productDetailBloc) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;

    try {
      final Size size = renderBox.size;
      // debugPrint(size.height.toString());
      productDetailBloc.cropHeighProductDescription(size.height);
    } catch (e, s) {
      debugPrint(e.toString());
      // debugPrint(s.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('build');

    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    Future.delayed(Duration.zero,
        () => onProductDescriptionHeightChange(productDetailBloc));
    return StreamBuilder<bool>(
        initialData: true,
        stream: productDetailBloc.productDescriptionSeemoreStream,
        builder: (_, seemoreSnap) {
          double? containerHeight;
          bool shrinkWrap;

          if (seemoreSnap.data == true) {
            containerHeight = null;
            shrinkWrap = true;
          } else {
            containerHeight = 500;
            shrinkWrap = false;
          }
          return Stack(
            children: [
              SizedBox(
                // curve: Curves.decelerate,
                // duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  key: _widgetKey,
                  height: containerHeight,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: shrinkWrap,
                    children: [
                      // title('Mô tả sản phẩm'),
                      content(description),
                      NotificationListener<SizeChangedLayoutNotification>(
                          onNotification:
                              (SizeChangedLayoutNotification notification) {
                            onProductDescriptionHeightChange(productDetailBloc);
                            return true;
                          },
                          child: SizeChangedLayoutNotifier(
                              child: ProductImages(imagesLink)))
                      // title('Màu sắc'),
                      // content('có 3 màu: cam, xanh và trắng'),
                    ],
                  ),
                ),
              ),
              !shrinkWrap
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ]),
                        ),
                        width: Screen.width,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                padding:
                                    const EdgeInsets.only(top: 60, bottom: 10)),
                            onPressed: () {
                              productDetailBloc
                                  .changeProductDescriptionSeemore();
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Xem thêm',
                                      style: TextStyle(
                                          fontFamily: defaultFont,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black),
                                    ),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(left: 8.09),
                                        width: 8,
                                        child: Image.asset(AssetLink.seeMore))
                                  ],
                                ),
                              ],
                            )),
                      ),
                    )
                  : const SizedBox()
            ],
          );
        });
  }
}
