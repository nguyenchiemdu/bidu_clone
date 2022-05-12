import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_infor_tab.dart';

class TabBarViewProduct extends StatelessWidget {
  TabBarViewProduct({Key? key}) : super(key: key);
  // final GlobalKey widgetKey;

  // void didWidgetRendered(_) {
  //   ProductDetailBloc productDetailBloc = context.read<ProductDetailBloc>();
  //   final GlobalKey widgetKey = widget.widgetKey;
  //   final RenderBox renderBox =
  //       widgetKey.currentContext?.findRenderObject() as RenderBox;
  //   final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   productDetailBloc.updateTabbarPosition(offset.dy);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback(didWidgetRendered);
  // }

  // int _selectedIndex = 0;
  final tabBarStyle = TextStyle(
      fontFamily: defaultFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: DesignColor.textGrayColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        // key: widgetKey,
        margin: const EdgeInsets.only(top: 2),
        color: DesignColor.textWhite,
        child: StreamBuilder<int>(
            initialData: 0,
            stream:
                Provider.of<ProductDetailBloc>(context).selectedTabBarStream,
            builder: (_, selectedTabBarSnap) {
              int _selectedIndex = selectedTabBarSnap.data ?? 0;
              Widget selectedTab;
              if (_selectedIndex == 0) {
                selectedTab = const ProductInforTab();
              } else if (_selectedIndex == 1) {
                selectedTab = const ProductInforTab();
              } else {
                selectedTab = const ProductInforTab();
              }

              return SingleChildScrollView(
                child: selectedTab,
              );
            }));
  }
}
