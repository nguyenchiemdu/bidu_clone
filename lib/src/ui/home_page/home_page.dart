import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/navbar.dart';
import 'package:provider/provider.dart';
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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = context.read<HomeBloc>().scrollController;
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
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xffF1F1F1),
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const BannerWidget(),
                      Category(),
                      const MiniBanner(),
                      const BiduLive(),
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
            floatingActionButton: const HomeFloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: const HomeNavBar()),
        Positioned(
          bottom: 100,
          child: StreamBuilder<bool>(
              stream: context.read<HomeBloc>().backToTopStream,
              builder: (context, snapshot) {
                // debugPrint('build');
                bool backToTop = snapshot.data ?? false;
                return backToTop
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: () => context.read<HomeBloc>().scrollTo(0),
                        child: const Text('Back to Top',
                            style: TextStyle(color: Color(0xffE812A4))),
                      )
                    : const SizedBox();
              }),
        )
      ],
    );
  }
}
