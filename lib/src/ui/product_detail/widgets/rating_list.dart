import 'package:flutter/material.dart';

import '../../../models/product.dart';
import 'rating_item.dart';

class RatingList extends StatelessWidget {
  const RatingList(this.ratings, {Key? key}) : super(key: key);
  final List<FeedBackByStar> ratings;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 20),
        childAspectRatio: 110 / 27,
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: ratings
            .map((rate) => RatingItem(rate.voteStar, rate.total))
            .toList());
  }
}
