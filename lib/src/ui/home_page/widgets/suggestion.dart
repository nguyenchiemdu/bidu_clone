import 'package:bidu_clone/common/asset_link.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';

import '../../../../common/font.dart';
import '../../../models/product.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: Provider.of<HomeBloc>(context).suggestionStream,
        builder: (context, snapshot) {
          final List<Product> suggestions;
          suggestions = snapshot.data ?? [];
          final int numberColumns =
              suggestions.length ~/ 2 + (suggestions.length % 2 != 0 ? 1 : 0);
          List<TrackSize> rowSizes = [];
          for (int i = 0; i < numberColumns; i++) {
            rowSizes.add(auto);
          }
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2),
            padding:
                const EdgeInsets.only(left: 16, top: 24, bottom: 24, right: 16),
            child: Column(children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Gợi ý cho bạn',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Xem thêm',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Image.asset(
                            seeMoreArrow,
                            width: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //TODO : moi hang co 1 height rieng done research thu vien LATER
              rowSizes.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: LayoutGrid(
                        columnSizes: [1.fr, 1.fr],
                        rowSizes: rowSizes,
                        rowGap: 20,
                        columnGap: 10,
                        children: suggestions
                            .map((suggestion) => productItem(
                                context, suggestion,
                                selled: 123, isQuaranteed: true))
                            .toList(),
                      ),
                    )
                  : const SizedBox(),
            ]),
          );
        });
  }
}
