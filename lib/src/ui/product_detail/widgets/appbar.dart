import 'package:bidu_clone/common/asset_link.dart';
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
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            appBarBackButton,
            width: 32,
          ),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(appBarShareButton)),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(appBarCartButton)),
        ]);
