import 'package:bidu_clone/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors.dart';
import '../../../../common/font.dart';
import '../../../blocs/product_detail_bloc.dart';

//TODO : gom lai thanh 1 file String  DONE

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
      pinned: true,
    );
  }
}
