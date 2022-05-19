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
        //TODO: dat trong init state DONE
        context.read<ProductDetailBloc>().initLoad(productData);
        return const _DetailPage();
      },
    );
  }
}

//TODO: navigator route  , pop until
//TODO : dung sliver persisten header, nested
//TODO : dung stateful widget , init state ,
class _DetailPage extends StatelessWidget {
  const _DetailPage({Key? key}) : super(key: key);
  bool _onScrollNotification(
      BuildContext context, ScrollUpdateNotification notification) {
    if (notification.metrics.axisDirection == AxisDirection.down) {
      context.read<ProductDetailBloc>().onScroll(notification.metrics.pixels);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Color>(
        initialData: productDetailBloc.appBarColor,
        stream: productDetailBloc.appbarColorStream,
        builder: (_, appBarColorSnap) {
          // debugPrint('build');
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                //TODO: dung chuc nang cua sliver appbar or custom
                // extendBodyBehindAppBar: true,
                appBar: productDetailAppbar(appBarColorSnap),
                body: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (ScrollUpdateNotification notification) =>
                      _onScrollNotification(context, notification),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([
                        BannerWidget(),
                        const ShopInFor(),
                        const ProductInfor(),
                        const DeliverInfor(),
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
