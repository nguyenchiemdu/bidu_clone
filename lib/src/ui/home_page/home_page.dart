import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:provider/provider.dart';
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
        appBar: AppBar(
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
          // ),
          // foregroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          toolbarHeight: 38,
          leadingWidth: 58.5,
          leading: Container(
            padding: const EdgeInsets.only(left: 16, top: 6),
            child: GestureDetector(
              child: Image.asset(
                'assets/icons/logo.png',
                // height: 32,
              ),
              onTap: () {
                // print('tapped');
              },
            ),
          ),
          // title: Text(widget.title),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 13, top: 6),
              child: GestureDetector(
                child: Image.asset(
                  'assets/icons/search_icon.png',
                  width: 32,
                  height: 32,
                ),
                onTap: () {
                  // print('tapped');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 13, top: 6),
              child: GestureDetector(
                child: Image.asset(
                  'assets/icons/message_icon.png',
                  width: 32,
                  height: 32,
                ),
                onTap: () {
                  // print('tapped');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 13, top: 6),
              child: GestureDetector(
                child: Image.asset(
                  'assets/icons/notification_icon.png',
                  width: 32,
                  height: 32,
                ),
                onTap: () {
                  // print('tapped');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16, top: 6),
              child: GestureDetector(
                child: Image.asset(
                  'assets/icons/cart_icon.png',
                  width: 32,
                  height: 32,
                ),
                onTap: () {
                  // print('tapped');
                },
              ),
            ),
          ],
        ),
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xffE812A4),
            onPressed: () {
              // print('tapped');
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 11.86,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(right: Screen.width * 80 / 375),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {},
              currentIndex: 0,
              iconSize: 24,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/nav_bidu.png',
                    width: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/nav_shop.png',
                    width: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/nav_heart.png',
                    width: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/nav_compass.png',
                    width: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/nav_account.png',
                    width: 24,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
