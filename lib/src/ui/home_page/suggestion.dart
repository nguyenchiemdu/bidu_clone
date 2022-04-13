import 'package:bidu_clone/src/blocs/suggestion_bloc.dart';
import 'package:bidu_clone/src/resources/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Suggestion extends StatelessWidget {
  Suggestion({Key? key}) : super(key: key);
  final priceFormat = NumberFormat('###,###,##0.##');
  final SuggestionBloc suggestionBloc = SuggestionBloc();
  @override
  Widget build(BuildContext context) {
    Api.getListSuggestion().then(suggestionBloc.updateChange);
    final double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<List?>(
        stream: suggestionBloc.suggestionStream,
        builder: (context, snapshot) {
          List suggestions = snapshot.data ?? [];
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 45),
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
                margin: const EdgeInsets.only(top: 20),
                height: (screenWidth - 0) * 104 / 375,
                child: ListView.builder(
                    itemCount: suggestions.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      final double itemWidth = (screenWidth - 0) * 313 / 375;
                      // print(suggestions[index]);
                      // print(suggestions[index]['images'][0]);
                      return Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: itemWidth,
                        height: (screenWidth - 0) * 104 / 375,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.grey,
                                    //         width: 1,
                                    //         style: BorderStyle.solid)),
                                    width: (screenWidth - 0) * 104 / 375,
                                    height: (screenWidth - 0) * 104 / 375,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        suggestions[index]['images'][0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5.31,
                                    right: 7.08,
                                    child: Image.asset(
                                      'assets/icons/mark.png',
                                      width: 13.27,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          suggestions[index]['name'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            priceFormat.format(
                                                suggestions[index]
                                                        ['sale_price'] ??
                                                    0),
                                            style: const TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                          const Text(
                                            ' ₫',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/location.png',
                                            width: 7.08,
                                          ),
                                          const Text(
                                            'Việt Nam',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            Text(
                                              'Đã bán 120',
                                              style: TextStyle(
                                                  color: Color(0xff9A9A9A),
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      );
                    })),
              )
            ]),
          );
        });
  }
}
