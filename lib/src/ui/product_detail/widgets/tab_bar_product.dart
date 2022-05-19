import 'package:bidu_clone/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import '../../../blocs/product_detail_bloc.dart';

//TODO : gom lai thanh 1 file String  DONE
const double _kAppbarHeight = 40;

class TabBarProduct extends StatelessWidget {
  const TabBarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: _MySliverPersistentHeaderDelegate());
  }
}

class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(_kAppbarHeight),
      child: Container(
        color: Colors.white,
        child: TabBar(
          //TODO: dung Tab controller  thay cho default tab controller
          // controller: ,
          isScrollable: true,
          indicatorColor: DesignColor.textBlackColor,
          onTap: (index) {
            context.read<ProductDetailBloc>().changeSelectedTabBar(index);
          },
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
