import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/category.dart' as category_model;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<List<category_model.Category>>(
      stream: Provider.of<HomeBloc>(context).categoryStream,
      builder: (context, snapshot) {
        final List<category_model.Category> categories;
        categories = snapshot.data ?? [];
        double height =
            (categories.length ~/ 5 + (categories.length % 5 != 0 ? 1 : 0)) *
                    width /
                    5 +
                21;
        categories.sort((a, b) => a.priority.compareTo(b.priority));
        return Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 21),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
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
                            child: CachedImageCustom(
                              categories[index].avatar,
                              circleSize: 10,
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
          ),
        );
      },
    );
  }
}
