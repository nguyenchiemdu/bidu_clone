import 'dart:math';

import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/category.dart' as category_model;
import 'package:bidu_clone/src/ui/home_page/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/asset_link.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);
  final category_model.Category seeMore = category_model.Category(
      id: 'seemore', name: 'Xem thêm', avatar: seeMoreCategory, priority: 8);
  double getMinHeight(double width) {
    int numberItems = 5;
    int numberRows = 2;
    int paddingTop = 21;
    return width / numberItems * numberRows + paddingTop;
  }

  double getMaxHeight(double width, int numberCategories) {
    int itemsInRow = 5;
    int numberColumns = (numberCategories / itemsInRow).ceil();
    double itemsHeight = width / itemsInRow;
    double paddingTop = 21;
    return numberColumns * itemsHeight + paddingTop;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<List<category_model.Category>>(
      stream: Provider.of<HomeBloc>(context).categoryStream,
      builder: (_, categorySnapshot) {
        late List<category_model.Category> categories;
        bool addedSeeMore = false;
        categories = categorySnapshot.data ?? [];

        final minHeight = getMinHeight(width);
        final maxHeight = getMaxHeight(width, categories.length);

        if (categorySnapshot.hasData) {
          return StreamBuilder<double>(
              stream: context.read<HomeBloc>().scrollStream,
              builder: (_, scrollSnapshot) {
                HomeBloc homeBloc = context.read<HomeBloc>();
                VoidCallback seeMoreCallback;
                seeMoreCallback =
                    () => homeBloc.seeMore((minHeight - maxHeight) / 3);
                double delta = scrollSnapshot.data ?? 0;
                double height = homeBloc.categoryHeight ?? maxHeight;
                homeBloc.categoryHeight ??= height;

                // check to make sure minHeight < height < maxHeight
                height = max(height - delta * 3, minHeight);
                height = height < maxHeight ? height : maxHeight;
                // update to BLoC
                homeBloc.categoryHeight = height;
                // debugPrint(height.toString());
                // check and render see more button
                if (height == minHeight &&
                    categories.isNotEmpty & !addedSeeMore) {
                  categories.insert(9, seeMore);
                  addedSeeMore = !addedSeeMore;
                  homeBloc.isCategoryCollapsed = true;
                }
                if (height > minHeight &&
                    categories.isNotEmpty & addedSeeMore) {
                  categories.removeAt(9);
                  addedSeeMore = !addedSeeMore;
                }
                return Container(
                  color: Colors.white,
                  //TODO: (Trung) không dùng double.infinity để size DONE
                  // width: double.infinity,
                  height: height,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 21),
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      //TODO:(Trung) nếu biến [context] không được sử dụng thì đặt tên nó thành _ để tránh nhầm lẫn với biến context của build function DONE
                      itemBuilder: (_, int index) {
                        //TODO: tach thanh 1 widget nho, dung InkWell DONE
                        return CategoryItem(categories[index], seeMoreCallback);
                      }),
                );
              });
        } else {
          return const SizedBox(
            child: Text('loading'),
          );
        }
      },
    );
  }
}
