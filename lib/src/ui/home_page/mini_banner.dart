import 'package:bidu_clone/src/blocs/mini_banner_bloc.dart';
import 'package:flutter/material.dart';

import '../../resources/api.dart';

class MiniBanner extends StatelessWidget {
  MiniBanner({Key? key}) : super(key: key);
  final MiniBannerBloc miniBannerBloc = MiniBannerBloc();
  @override
  Widget build(BuildContext context) {
    Api.getListBanner().then(miniBannerBloc.updateChange);
    return StreamBuilder<List?>(
        stream: miniBannerBloc.bannerStream,
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
