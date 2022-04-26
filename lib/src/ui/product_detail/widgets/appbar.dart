import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

AppBar productDetailAppbar() => AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        // remove bottom shadow
        elevation: 0,
        leadingWidth: 40,
        leading: Container(
          //TODO: (Trung) thiếu action
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            'assets/icons/back_button.svg',
            width: 32,
          ),
        ),
        actions: [
          //TODO: (Trung) thiếu action
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset('assets/icons/share_button.svg')),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset('assets/icons/cart_button.svg')),
        ]);
