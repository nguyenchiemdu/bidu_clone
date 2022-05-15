import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/resources/product_detail_cloud_datasource.dart';
import 'package:bidu_clone/src/resources/product_detail_repository.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/banner_widget.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/bottom_bar.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/deliver_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/shop_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/tab_bar_view_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../blocs/product_detail_bloc.dart';
import 'widgets/appbar.dart';
import 'widgets/tab_bar_product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(this.productData, {Key? key}) : super(key: key);
  final Product productData;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductDetailCloudDataSource>(
            create: (_) => ProductDetailCloudDataSource()),
        ProxyProvider<ProductDetailCloudDataSource, ProductDetailRepository>(
            update: ((context, productDetailCloudDataSource, previous) =>
                previous ??
                ProductDetailRepository(productDetailCloudDataSource))),
        ProxyProvider<ProductDetailRepository, ProductDetailBloc>(
            update: ((context, productDetailRepository, previous) =>
                previous ?? ProductDetailBloc(productDetailRepository)))
      ],
      builder: (context, child) {
        final ProductDetailBloc productDetailBloc =
            context.read<ProductDetailBloc>();
        productDetailBloc.product = productData;
        productDetailBloc.loadProductDetailById();
        return const _DetailPage();
      },
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({Key? key}) : super(key: key);
  // final ScrollController scrollController = ScrollController();
  // final GlobalKey _widgetKey = GlobalKey();
  // final ScrollController _scrollController = ScrollController();
  bool _onScrollNotification(
      BuildContext context, ScrollUpdateNotification notification) {
    // final RenderBox renderBox =
    //     _widgetKey.currentContext?.findRenderObject() as RenderBox;

    // final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    // debugPrint('Size: ${size.width}, ${size.height}');

    // final Offset offset = renderBox.localToGlobal(Offset.zero);
    if (notification.metrics.axisDirection == AxisDirection.down) {
      context.read<ProductDetailBloc>().onScroll(notification.metrics.pixels);
      // debugPrint('Offset:${offset.dx} , ${offset.dy}');
      // debugPrint(notification.metrics.pixels.toString());
    }

    // debugPrint(
    // 'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
        initialData: Colors.transparent,
        stream: context.read<ProductDetailBloc>().appbarColorStream,
        builder: (_, appBarColorSnap) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: productDetailAppbar(appBarColorSnap),
                body: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (ScrollUpdateNotification notification) =>
                      _onScrollNotification(context, notification),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate(const [
                        BannerWidget(),
                        ShopInFor(),
                        ProductInfor(),
                        DeliverInfor(),
                      ])),
                      const TabBarProduct(),
                      SliverList(
                          delegate:
                              SliverChildListDelegate([TabBarViewProduct()])),
                      // Container(height: 5000, color: Colors.red)
                    ],
                  ),
                ),
                bottomNavigationBar: const BottomBar()),
          );
        });
  }
}
