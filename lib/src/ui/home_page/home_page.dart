import 'package:bidu_clone/src/ui/home_page/mini_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'banner.dart';
import 'category.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
              print('tapped');
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
                print('tapped');
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
                print('tapped');
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
                print('tapped');
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
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
              height: 165,
              color: Colors.transparent,
              child: MiniBanner(),
            ),
            Container(
              height: 1000,
              color: Colors.blue,
            ),
            Container(
              height: 1000,
              color: Colors.red,
            )
          ],
        )),
      ),
    );
  }
}
