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
      //TODO:(Trung) nếu biến [context] không được sử dụng thì đặt tên nó thành _ để tránh nhầm lẫn với biến context của build function
      builder: (context, snapshot) {
        final List<category_model.Category> categories;
        categories = snapshot.data ?? [];
        // TODO: (Trung) nên viết thành 1 hàm tính chiều cao item
        double height =
            (categories.length ~/ 5 + (categories.length % 5 != 0 ? 1 : 0)) *
                    width /
                    5 +
                21;
        // TODO: (Trung) nên xử lý bên trong bloC
        categories.sort((a, b) => a.priority.compareTo(b.priority));
        return Container(
          color: Colors.white,
          child: SizedBox(
            width: double
                .infinity, //TODO: (Trung) không dùng double.infinity để size
            height: height,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 21),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                //TODO:(Trung) nếu biến [context] không được sử dụng thì đặt tên nó thành _ để tránh nhầm lẫn với biến context của build function
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // print(categories[index]);
                    },
                    // TODO: (Trung) nên tách thành 1 statelesswidget
                    child: SizedBox(
                      width: width / 5,
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Image.network(
                            categories[index].avatar,
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                              // TODO: (Trung) nên viết chung vào theme
                              fontFamily: "Lexend",
                              fontSize: 10),
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
