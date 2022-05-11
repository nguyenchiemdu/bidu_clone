import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/navbar.dart';
import 'package:provider/provider.dart';
import '../../../common/colors.dart';
import 'widgets/appbar.dart';
import 'widgets/floating_button.dart';
import 'widgets/live.dart';
import 'widgets/mini_banner.dart';
import 'widgets/suggestion.dart';
import 'widgets/top_products.dart';
import 'package:flutter/material.dart';
import 'widgets/banner.dart';
import 'widgets/category.dart';
import 'widgets/newest_products.dart';
import 'widgets/top_sellers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  bool _onScrollNotification(
      BuildContext context, ScrollUpdateNotification notification) {
    // print(notification.scrollDelta);
    double? delta = notification.scrollDelta;
    double pixels = notification.metrics.pixels;
    final HomeBloc homeBloc = context.read<HomeBloc>();
    if (delta != null && !homeBloc.isCategoryCollapsed) {
      context.read<HomeBloc>().updateCategory(delta);
    }
    homeBloc.updateBackToTopButton(pixels);
    return true;
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    Screen.width = MediaQuery.of(context).size.width;
    Screen.height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
            extendBodyBehindAppBar: false,
            // this line to make a transpanrent curve for navbar
            extendBody: true,
            appBar: appBarWidget(),
            body: Container(
              color: DesignColor.backgroundColor,
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (ScrollUpdateNotification notification) =>
                    _onScrollNotification(context, notification),
                child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      //TODO: (Trung) nếu muốn children của column trải dài bằng chiều rộng của parent thì set crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BannerWidget(),
                        Category(),
                        const MiniBanner(),
                        const Live(),
                        const NewestProducts(),
                        const TopSellers(),
                        const TopProducts(),
                        const Suggestion(),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    )),
              ),
            ),
            floatingActionButton: const HomeFloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: const HomeNavBar()),
        Positioned(
          bottom: 100,
          child: StreamBuilder<bool>(
              stream: context.read<HomeBloc>().backToTopStream,
              builder: (context, snapshot) {
                bool backToTop = snapshot.data ?? false;
                return backToTop
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: _scrollToTop,
                        child: Text('Back to Top',
                            style:
                                TextStyle(color: DesignColor.gradientPrimary1)),
                      )
                    : const SizedBox();
              }),
        )
      ],
    );
  }
}
