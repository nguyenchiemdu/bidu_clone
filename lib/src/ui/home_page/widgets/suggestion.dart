import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/suggestion.dart' as suggestion_model;
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
                                  SizedBox(
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
                                        suggestions[index].images[0].toString(),
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
                                      SizedBox(
                                        child: Text(
                                          suggestions[index].name,
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
                                            priceFormnat(
                                                suggestions[index].salePrice),
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
