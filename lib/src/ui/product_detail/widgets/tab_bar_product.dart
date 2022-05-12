import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import '../../../blocs/product_detail_bloc.dart';

const _kProductInfor = 'Thông tin sản phẩm';
const _kEvaluate = 'Đánh giá (40)';
const _kChat = 'Trò Chuyện';

class TabBarProduct extends StatelessWidget {
  const TabBarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      collapsedHeight: 0,
      toolbarHeight: 0,
      expandedHeight: 0,
      elevation: 0,
      bottom: TabBar(
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
            child: Text(_kProductInfor),
          ),
          Tab(
            child: Text(_kEvaluate),
          ),
          Tab(
            child: Text(_kChat),
          ),
        ],
      ),
      pinned: true,
    );
  }
}
