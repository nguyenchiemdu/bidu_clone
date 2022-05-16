import 'package:flutter/material.dart';

import '../../screen_size.dart';

class BannerIndicator extends StatelessWidget {
  const BannerIndicator(this.stream, this.banners,
      {this.initData = 0, Key? key})
      : super(key: key);
  final Stream<int> stream;
  final int? initData;
  final List banners;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: initData,
        stream: stream,
        builder: (context, bannerIndicator) {
          // debugPrint(bannerIndicator.hasData.toString());
          if (banners.isNotEmpty) {
            int indicator = bannerIndicator.data ?? 0;
            double totalWidth = Screen.width * 165 / 375;
            double indicatorWidth = totalWidth / banners.length;
            double marginLeft = indicator * indicatorWidth;
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
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.only(left: marginLeft),
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
        });
  }
}
