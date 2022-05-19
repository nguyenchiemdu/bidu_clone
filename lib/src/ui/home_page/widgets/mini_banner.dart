import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bidu_clone/src/models/banner.dart' as banner_model;
import '../../../../common/app_strings.dart';
import '../../../../common/cached_network_image.dart';
import '../../../blocs/home_bloc.dart';

class MiniBanner extends StatelessWidget {
  const MiniBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<banner_model.Banner>>(
        stream: Provider.of<HomeBloc>(context).bannerStream,
        builder: (context, snapshot) {
          final List<banner_model.Banner> banners;
          banners = snapshot.data ?? [];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(AppString.loading);
          } else if (snapshot.hasError) {
            return const Text(AppString.apiError);
          } else {
            return SizedBox(
              // size of the banner is 750x348
              height: Screen.width * 348 / 750,
              child: PageView.builder(
                  itemCount: banners.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Container(
                        margin: const EdgeInsets.all(0),
                        child: CachedImageCustom(
                            banners[pagePosition].images?[0].top ?? ''));
                  }),
            );
          }
        });
  }
}
