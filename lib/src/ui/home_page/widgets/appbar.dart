import 'package:flutter/material.dart';

AppBar appBarWidget() => AppBar(
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
    );
