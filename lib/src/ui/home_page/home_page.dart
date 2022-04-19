import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/resources/home_repository.dart';
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
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Screen.width = MediaQuery.of(context).size.width;
    Screen.height = MediaQuery.of(context).size.height;
    return
        // This provider is as DI container
        Provider<IHomeRepository>(
      // Dependency
      create: (context) => HomeRepository(),
      builder: (context, child) {
        //TODO : tao HomeBloc ben trong Scafold
        return Provider<HomeBloc>(
            // Injeciton, HomeBloc depend on interface instead of class
            create: (_) => HomeBloc(context.read<IHomeRepository>()),
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
                    children: const [
                      BannerWidget(),
                      Category(),
                      MiniBanner(),
                      BiduLive(),
                      NewestProducts(),
                      TopSellers(),
                      TopProducts(),
                      Suggestion(),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  )),
                ),
                floatingActionButton: const HomeFloatingButton(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                bottomNavigationBar: const HomeNavBar()));
      },
    );
  }
}
