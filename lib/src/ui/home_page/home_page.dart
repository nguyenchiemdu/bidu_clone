import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/live.dart';
import 'package:bidu_clone/src/ui/home_page/mini_banner.dart';
import 'package:bidu_clone/src/ui/home_page/suggestion.dart';
import 'package:bidu_clone/src/ui/home_page/top_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'banner.dart';
import 'category.dart';
import 'newest_products.dart';
import 'top_sellers.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.width = MediaQuery.of(context).size.width;
    Screen.height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        toolbarHeight: 38,
        leadingWidth: 48,
        leading: Container(
          padding: const EdgeInsets.only(left: 16, top: 6),
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
        // title: Text(widget.title),
        actions: [
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
              child: BannerWidget(),
            ),
            Category(),
            Container(
              height: 175,
              color: Colors.transparent,
              child: MiniBanner(),
            ),
            const BiduLive(),
            NewestProducts(),
            TopSellers(),
            TopProducts(),
            Suggestion(),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffE812A4),
          onPressed: () {
            // print('tapped');
          },
          child: Icon(Icons.add)),
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
    );
  }
}
