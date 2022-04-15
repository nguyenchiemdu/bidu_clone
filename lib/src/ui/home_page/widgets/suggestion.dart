import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/suggestion.dart' as suggestion_model;
import 'package:bidu_clone/src/ui/home_page/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<List<suggestion_model.Suggestion>>(
        stream: Provider.of<HomeBloc>(context).suggestionStream,
        builder: (context, snapshot) {
          final List<suggestion_model.Suggestion> suggestions;
          suggestions = snapshot.data ?? [];
          final int numberColumns =
              suggestions.length ~/ 2 + (suggestions.length % 2 != 0 ? 1 : 0);
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2),
            padding:
                const EdgeInsets.only(left: 16, top: 24, bottom: 45, right: 16),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Gợi ý cho bạn',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Xem thêm',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Image.asset(
                            'assets/icons/arrow.png',
                            width: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                margin: const EdgeInsets.only(top: 20),
                height: numberColumns == 0
                    ? 0
                    : (screenWidth - 16 * 2 - 10) /
                            2 *
                            280 /
                            166 *
                            numberColumns +
                        20 * (numberColumns - 1),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // padding: const EdgeInsets.only(top: 21),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 166 / 280,
                      crossAxisCount: 2,
                    ),
                    itemCount: suggestions.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      final double itemWidth = (screenWidth - 0) * 313 / 375;
                      // print(suggestions[index]);
                      // print(suggestions[index]['images'][0]);
                      return productItem(suggestions[index],
                          selled: 123, isQuaranteed: true);
                    })),
              )
            ]),
          );
        });
  }
}
