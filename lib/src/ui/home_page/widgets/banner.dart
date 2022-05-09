import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/banner.dart' as banner_model;
import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/banner_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          //TODO: (Trung) thiếu xử lý UI khi banner đang được load từ api và trường hợp api lỗi DONE
          return !snapshot.hasData && !snapshot.hasError
              ? const Text('loading')
              : snapshot.hasError
                  ? const Text('API error')
                  : SizedBox(
                      // size of the banner is 750x348
                      //TODO : them indicator DONE
                      height: Screen.width * 348 / 750,
                      child: Stack(
                        children: [
                          PageView.builder(
                              controller: _pageController,
                              itemCount: banners.length,
                              pageSnapping: true,
                              //TODO:(Trung) nếu biến [context] không được sử dụng thì đặt tên nó thành _ để tránh nhầm lẫn với biến context của build function DONE
                              itemBuilder: (_, pagePosition) {
                                String imageUrl =
                                    banners[pagePosition].images?[0].top ?? '';
                                return BannerImage(imageUrl);
                              }),
                          StreamBuilder<int>(
                              stream: context
                                  .read<HomeBloc>()
                                  .bannerIndicatorStream,
                              builder: (context, bannerIndicator) {
                                // debugPrint(bannerIndicator.hasData.toString());
                                if (banners.isNotEmpty) {
                                  int indicator = bannerIndicator.data ?? 0;
                                  double totalWidth = Screen.width * 165 / 375;
                                  double indicatorWidth =
                                      totalWidth / banners.length;
                                  double marginLeft =
                                      indicator * indicatorWidth;
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Container(
                                        width: totalWidth,
                                        height: 2,
                                        color: Colors.white.withOpacity(0.3),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            margin: EdgeInsets.only(
                                                left: marginLeft),
                                            width: indicatorWidth,
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              })
                        ],
                      ),
                    );
        });
  }
}
