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
            const SizedBox(
              height: 65,
            )
          ],
        )),
      ),
    );
  }
}
