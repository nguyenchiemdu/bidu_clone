import 'dart:math';

import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/category.dart' as category_model;
import 'package:bidu_clone/src/ui/home_page/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);
  final category_model.Category seeMore = category_model.Category(
      id: 'seemore',
      name: 'Xem thêm',
      avatar: 'assets/icons/see_more_category.svg',
      priority: 8);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<List<category_model.Category>>(
      stream: Provider.of<HomeBloc>(context).categoryStream,
      builder: (context, categorySnapshot) {
        late List<category_model.Category> categories;
        bool addedSeeMore = false;
        categories = categorySnapshot.data ?? [];
        categories.sort((a, b) => a.priority.compareTo(b.priority));
        final minHeight = width / 5 * 2 + 21;
        final maxHeight = (((categories.length / 5).ceil() * width / 5) + 21);

        if (categorySnapshot.hasData) {
          return StreamBuilder<double>(
              stream: context.read<HomeBloc>().scrollStream,
              builder: (context, scrollSnapshot) {
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
                  width: double.infinity,
                  height: height,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 21),
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        //TODO: tach thanh 1 widget nho, dung InkWell done
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
