import 'package:bidu_clone/src/blocs/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bidu_clone/src/models/banner.dart' as banner_model;
import '../../../blocs/home_bloc.dart';

class MiniBanner extends StatelessWidget {
  MiniBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
        stream: Provider.of<HomeBloc>(context).bannerStream,
        builder: (context, snapshot) {
          final List<banner_model.Banner> banners;
          if (snapshot.data is BannerLoaded) {
            banners = (snapshot.data as BannerLoaded).listBanner;
          } else {
            banners = [];
          }
          return PageView.builder(
              itemCount: banners.length,
              pageSnapping: true,
              itemBuilder: (context, pagePosition) {
                return Container(
                    margin: const EdgeInsets.all(0),
                    child: Image.network(
                        banners[pagePosition].images?[0].top ?? ''));
              });
        });
  }
}
