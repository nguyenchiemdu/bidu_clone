import 'package:bidu_clone/src/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, this.seeMore, {Key? key}) : super(key: key);
  final Category category;
  final VoidCallback seeMore;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        child: InkWell(
          onTap: category.id == 'seemore' ? seeMore : () {},
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SizedBox(
                width: 32,
                height: 32,
                child: category.id != 'seemore'
                    ? CachedImageCustom(
                        category.avatar,
                        circleSize: 10,
                      )
                    : SvgPicture.asset(category.avatar),
              ),
            ),
            Text(
              category.name,
              style: const TextStyle(fontFamily: "Lexend", fontSize: 10),
            )
          ]),
        ),
      ),
    );
  }
}
