import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/common/font.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_infor_tab.dart';

class TabBarProduct extends StatefulWidget {
  const TabBarProduct({Key? key}) : super(key: key);

  @override
  State<TabBarProduct> createState() => _TabBarProductState();
}

class _TabBarProductState extends State<TabBarProduct> {
  // int _selectedIndex = 0;
  final tabBarStyle = const TextStyle(
      fontFamily: defaultFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textGrayColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      color: textWhite,
      child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: textBlackColor,
                onTap: (index) {
                  context.read<ProductDetailBloc>().changeSelectedTabBar(index);
                },
                labelStyle: const TextStyle(
                    fontFamily: defaultFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textBlackColor),
                labelColor: textBlackColor,
                tabs: const [
                  Tab(
                    child: Text(
                      'Thông tin sản phẩm',
                      // style: tabBarStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Đánh giá (40)',
                      // style: tabBarStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Trò Chuyện',
                      // style: tabBarStyle,
                    ),
                  ),
                ],
              ),
              // Use builder to  make dynamic container height
              StreamBuilder<int>(
                  initialData: 0,
                  stream: Provider.of<ProductDetailBloc>(context)
                      .selectedTabBarStream,
                  builder: (_, selectedTabBarSnap) {
                    int _selectedIndex = selectedTabBarSnap.data ?? 0;
                    if (_selectedIndex == 0) {
                      return const ProductInforTab();
                    } else if (_selectedIndex == 1) {
                      return const Text('2');
                    } else {
                      return const Text('3');
                    }
                  })
            ],
          )),
    );
  }
}
