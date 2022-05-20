import 'package:bidu_clone/common/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';

const double _kAppbarHeight = 40;

//TODO : dung sliver persisten header, nested DONE
class TabBarProduct extends StatelessWidget {
  const TabBarProduct(this.controller, {Key? key}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: _MySliverPersistentHeaderDelegate(controller));
  }
}

class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  _MySliverPersistentHeaderDelegate(this.controller);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(_kAppbarHeight),
      child: Container(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          isScrollable: true,
          indicatorColor: DesignColor.textBlackColor,
          onTap: (index) {},
          labelStyle: TextStyle(
              fontFamily: defaultFont,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: DesignColor.textBlackColor),
          labelColor: DesignColor.textBlackColor,
          tabs: const [
            Tab(
              child: Text(AppString.productInfor),
            ),
            Tab(
              child: Text(AppString.evaluate),
            ),
            Tab(
              child: Text(AppString.chat),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => _kAppbarHeight;

  @override
  double get minExtent => _kAppbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
