import 'package:bidu_clone/src/models/product.dart';
import 'package:bidu_clone/src/resources/product_detail_cloud_datasource.dart';
import 'package:bidu_clone/src/resources/product_detail_repository.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/banner_widget.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/bottom_bar.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/deliver_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/evaluate_tab.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_infor.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/product_infor_tab.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/shop_infor.dart';
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

class _DetailPage extends StatefulWidget {
  const _DetailPage({Key? key}) : super(key: key);

  @override
  State<_DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<_DetailPage>
    with SingleTickerProviderStateMixin {
  bool _onScrollNotification(
      BuildContext context, ScrollUpdateNotification notification) {
    // debugPrint(notification.metrics.pixels.toString());
    if (notification.metrics.axisDirection == AxisDirection.down) {
      context.read<ProductDetailBloc>().onScroll(notification.metrics.pixels);
    }
    return true;
  }

  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (ScrollUpdateNotification notification) =>
              _onScrollNotification(context, notification),
          child: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return [
                  const ProductDetailAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      BannerWidget(),
                      const ShopInFor(),
                      const ProductInfor(),
                      const DeliverInfor(),
                    ]),
                  ),
                  TabBarProduct(controller)
                ];
              }),
              //TODO: dung Tab controller  thay cho default tab controller
              body: TabBarView(
                controller: controller,
                children: const [
                  ProductInforTab(),
                  EvaluateTab(),
                  Text('tab3')
                ],
              )),
        ),
        bottomNavigationBar: const BottomBar());
  }
}
