import 'dart:math';

import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/category.dart' as category_model;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        final minHeigh = width / 5 * 2 + 21;
        return StreamBuilder<double>(
            stream: context.read<HomeBloc>().scrollStream,
            builder: (context, scrollSnapshot) {
              // debugPrint('build');
              double height = (categories.length ~/ 5 +
                          (categories.length % 5 != 0 ? 1 : 0)) *
                      width /
                      5 +
                  21;
              height = max(height - (scrollSnapshot.data ?? 0) * 3, minHeigh);
              if (height == minHeigh && categories.isNotEmpty & !addedSeeMore) {
                categories.insert(9, seeMore);
                addedSeeMore = !addedSeeMore;
              }
              if (height > minHeigh && categories.isNotEmpty & addedSeeMore) {
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
                      //TODO: tach thanh 1 widget nho, dung InkWell
                      return GestureDetector(
                        onTap: () {
                          // print(categories[index]);
                        },
                        child: SizedBox(
                          width: width / 5,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: categories[index].id != 'seemore'
                                    ? CachedImageCustom(
                                        index == 1
                                            ? ''
                                            : categories[index].avatar,
                                        circleSize: 10,
                                      )
                                    : GestureDetector(
                                        onTap: () =>
                                            context.read<HomeBloc>().seeMore(),
                                        child: SvgPicture.asset(
                                            categories[index].avatar),
                                      ),
                              ),
                            ),
                            Text(
                              categories[index].name,
                              style: const TextStyle(
                                  fontFamily: "Lexend", fontSize: 10),
                            )
                          ]),
                        ),
                      );
                    }),
              );
            });
      },
    );
  }
}
