import 'package:bidu_clone/src/blocs/top_sellers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../resources/api.dart';

class TopSellers extends StatelessWidget {
  TopSellers({Key? key}) : super(key: key);
  final TopSellersBloc topSellersBloc = TopSellersBloc();
  final NumberFormat rateFormat = NumberFormat('0.0');
  String getNoSeller(int index) {
    if (index == 0) return 'assets/icons/no01.png';
    if (index == 1) return 'assets/icons/no02.png';
    return 'assets/icons/no03.png';
  }

  @override
  Widget build(BuildContext context) {
    Api.getListTopSellers().then(topSellersBloc.updateChange);
    return StreamBuilder<List?>(
        stream: topSellersBloc.topSellersStream,
        builder: ((context, snapshot) {
          List topSellers = snapshot.data ?? [];
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Người Bán',
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  Container(
                    height:
                        ((21 + 24 + 68 + 1) * (topSellers.length)).toDouble(),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: topSellers.length,
                        itemBuilder: ((context, index) {
                          Map seller = topSellers[index];
                          String developStatus =
                              seller['change']['type'] == 'UP'
                                  ? 'assets/icons/up.png'
                                  : 'assets/icons/down.png';
                          TextStyle developStyle = TextStyle(
                              color: seller['change']['type'] == 'UP'
                                  ? const Color(0xff12B74A)
                                  : const Color(0xffFF3232),
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                              fontSize: 12);
                          return Container(
                            padding: const EdgeInsets.only(bottom: 21, top: 24),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffF1F1F1),
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1A1A1A),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Text(
                                        seller['shop']['ranking_today']
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Lexend',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xffBBBBBB)
                                                      .withOpacity(0.25),
                                                  spreadRadius: 0,
                                                  blurRadius: 5,
                                                  offset: const Offset(2,
                                                      2), // changes position of shadow
                                                ),
                                              ]),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(34),
                                            child: Image.network(
                                              seller['shop']['user']['avatar'],
                                              fit: BoxFit.fill,
                                              width: 68,
                                              height: 68,
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Image.asset(
                                              'assets/icons/add.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          top: 3,
                                          right: 3,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Image.asset(
                                              getNoSeller(index),
                                              width: 18.04,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        seller['shop']['user']['userName']
                                            .toString()
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            fontFamily: 'Lexend',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 9),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 3.69),
                                              child: Image.asset(
                                                'assets/icons/heart.png',
                                                width: 14.31,
                                              ),
                                            ),
                                            Text(
                                              rateFormat.format(seller['shop']
                                                      ['avg_rating'] ??
                                                  0),
                                              style: const TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                            const Text(' | '),
                                            Text(
                                              seller['shop']['user']
                                                          ['follow_count']
                                                      .toString() +
                                                  ' lượt theo dõi',
                                              style: const TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Xem shop',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Image.asset(
                                              'assets/icons/black_arrow.png',
                                              width: 20,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Image.asset(
                                        developStatus,
                                        width: 8,
                                      ),
                                    ),
                                    Text(
                                      seller['change']['value'].toString(),
                                      style: developStyle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                  Container(
                    height: 66,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 13.8),
                          child: Text(
                            'Rút gọn',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/collapse.png',
                          width: 8.4,
                        )
                      ],
                    )),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
