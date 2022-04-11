import 'dart:convert';

import 'package:bidu_clone/src/resources/api.dart';
import 'package:flutter/material.dart';

import '../../blocs/banner_bloc.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);
  final BannerBloc bannerBloc = BannerBloc();
  @override
  Widget build(BuildContext context) {
    Api.getListBanner().then(bannerBloc.updateChange);
    return StreamBuilder<List?>(
        stream: bannerBloc.bannerStream,
        builder: (context, snapshot) {
          List banners = snapshot.data ?? [];
          if (banners.isNotEmpty) {
            banners.removeAt(0);
          }
          return PageView.builder(
              itemCount: banners.length,
              pageSnapping: true,
              itemBuilder: (context, pagePosition) {
                return Container(
                    margin: const EdgeInsets.all(0),
                    child: Image.network(banners[pagePosition]['image']));
              });
        });
  }
}
