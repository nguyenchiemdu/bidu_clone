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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    Screen.width = MediaQuery.of(context).size.width;
    Screen.height = MediaQuery.of(context).size.height;
    return Provider(
      create: (context) => homeBloc,
      child: Scaffold(
          extendBodyBehindAppBar: false,
          // this line to make a transpanrent curve for navbar
          extendBody: true,
          appBar: appBarWidget(),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xffF1F1F1),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 165,
                  color: Colors.transparent,
                  child: const BannerWidget(),
                ),
                const Category(),
                Container(
                  height: 175,
                  color: Colors.transparent,
                  child: const MiniBanner(),
                ),
                const BiduLive(),
                const NewestProducts(),
                const TopSellers(),
                const TopProducts(),
                const Suggestion(),
              ],
            )),
          ),
          floatingActionButton: const HomeFloatingButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: const HomeNavBar()),
    );
  }
}
