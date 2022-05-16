import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/banner.dart' as banner_model;
import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/banner_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widget/banner_indicator.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  void _updateIndicator(BuildContext context) {
    if (_pageController.page == _pageController.page?.roundToDouble()) {
      // debugPrint(_pageController.page.toString());
      context
          .read<HomeBloc>()
          .updateBannerIndicator(_pageController.page?.floor() ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() => _updateIndicator(context));
    return StreamBuilder<List<banner_model.Banner>>(
        stream: Provider.of<HomeBloc>(context).bannerStream,
        builder: (context, snapshot) {
          final List<banner_model.Banner> banners;
          banners = snapshot.data ?? [];
          final Stream<int> indicatorStream =
              context.read<HomeBloc>().bannerIndicatorStream;
          //TODO: Dung if else DONE
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          } else if (snapshot.hasError) {
            return const Text('API error');
          } else {
            return SizedBox(
              // size of the banner is 750x348
              height: Screen.width * 348 / 750,
              child: Stack(
                children: [
                  PageView.builder(
                      controller: _pageController,
                      itemCount: banners.length,
                      pageSnapping: true,
                      itemBuilder: (_, pagePosition) {
                        String imageUrl =
                            banners[pagePosition].images?[0].top ?? '';
                        return BannerImage(imageUrl);
                      }),
                  BannerIndicator(indicatorStream, banners)
                ],
              ),
            );
          }
        });
  }
}
