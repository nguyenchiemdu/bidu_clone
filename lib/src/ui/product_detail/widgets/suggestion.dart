import 'package:bidu_clone/common/app_strings.dart';
import 'package:bidu_clone/common/colors.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';

import '../../../../common/font.dart';
import '../../../models/product.dart';

class SuggestionProductDetail extends StatelessWidget {
  const SuggestionProductDetail({Key? key}) : super(key: key);
  Widget headLine() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppString.similarProduct,
            style: TextStyle(
                fontFamily: defaultFont,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: DesignColor.textBlackColor),
          ),
          // Row(
          //   children: [
          //     const Text(
          //       'Xem thêm',
          //       style: TextStyle(
          //           fontSize: 12,
          //           fontFamily: defaultFont,
          //           fontWeight: FontWeight.w400),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(left: 8),
          //       child: Image.asset(
          //         AssetLink.seeMoreArrow,
          //         width: 20,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  int getNumberColumn(int numberSuggestions) {
    int numberColumn = numberSuggestions ~/ 3;
    if (numberSuggestions % 3 != 0) {
      numberColumn++;
    }
    return numberColumn;
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        context.read<ProductDetailBloc>();
    return StreamBuilder<Product>(
        initialData: productDetailBloc.product,
        stream: productDetailBloc.productStream,
        builder: (context, snapshot) {
          late List<Product> suggestions;
          if (snapshot.hasData) {
            suggestions = [];
            for (int i = 0; i < 20; i++) {
              suggestions.add(snapshot.data!);
            }
          } else {
            suggestions = [];
          }
          // suggestions = snapshot.data ?? [];
          final int numberColumns = getNumberColumn(suggestions.length);
          List<TrackSize> rowSizes = [];
          for (int i = 0; i < numberColumns; i++) {
            rowSizes.add(auto);
          }
          return Container(
            // padding: const EdgeInsets.only(bottom: )
            color: Colors.white,
            child: Column(children: [
              headLine(),
              rowSizes.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: LayoutGrid(
                        columnSizes: [1.fr, 1.fr, 1.fr],
                        rowSizes: rowSizes,
                        rowGap: 16,
                        columnGap: 6,
                        children: suggestions
                            .map((suggestion) => ProductItem(suggestion,
                                selled: 123, isQuaranteed: true))
                            .toList(),
                      ),
                    )
                  : const SizedBox(),
              Container(
                width: Screen.width,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(top: 30, bottom: 24),
                child: OutlinedButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: DesignColor.textBlackColor),
                      primary: DesignColor.textBlackColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      AppString.seeAll,
                      style: TextStyle(
                          fontFamily: defaultFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
              )
            ]),
          );
        });
  }
}
