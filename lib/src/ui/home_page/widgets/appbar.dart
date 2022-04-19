import 'package:flutter/material.dart';

AppBar appBarWidget() => AppBar(
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
      // ),
      // foregroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      // remove bottom shadow
      elevation: 0,

      backgroundColor: Colors.white,
      toolbarHeight: 48,
      // leadingWidth: 58.5,
      leadingWidth: 75,
      leading: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 10),
        margin: const EdgeInsets.only(left: 16),
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
          margin: const EdgeInsets.only(right: 22, top: 6),
          child: GestureDetector(
            child: Image.asset(
              'assets/icons/search_icon.png',
              width: 24,
              height: 24,
            ),
            onTap: () {
              // print('tapped');
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 22, top: 6),
          child: GestureDetector(
            child: Image.asset(
              'assets/icons/message_icon.png',
              width: 24,
              height: 24,
            ),
            onTap: () {
              // print('tapped');
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 22, top: 6),
          child: GestureDetector(
            child: Image.asset(
              'assets/icons/notification_icon.png',
              width: 24,
              height: 24,
            ),
            onTap: () {
              // print('tapped');
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 17, top: 6),
          child: GestureDetector(
            child: Image.asset(
              'assets/icons/cart_icon.png',
              width: 24,
              height: 24,
            ),
            onTap: () {
              // print('tapped');
            },
          ),
        ),
      ],
    );
