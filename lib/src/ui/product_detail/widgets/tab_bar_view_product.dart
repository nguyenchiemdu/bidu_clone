import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/ui/product_detail/widgets/evaluate_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_infor_tab.dart';

class TabBarViewProduct extends StatelessWidget {
  TabBarViewProduct({Key? key}) : super(key: key);
  final ProductInforTab productInforTab = const ProductInforTab();
  final EvaluateTab evaluateTab = const EvaluateTab();
  final tabBarStyle = TextStyle(
      fontFamily: defaultFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: DesignColor.textGrayColor);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                selectedTab = productInforTab;
              } else if (_selectedIndex == 1) {
                selectedTab = evaluateTab;
              } else {
                selectedTab = Container(
                  height: 1000,
                );
              }
              return SingleChildScrollView(
                child: selectedTab,
              );
            }));
  }
}
