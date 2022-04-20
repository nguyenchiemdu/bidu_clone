import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TopSellers extends StatefulWidget {
  const TopSellers({Key? key}) : super(key: key);

  @override
  State<TopSellers> createState() => _TopSellersState();
}

class _TopSellersState extends State<TopSellers> {
  final NumberFormat rateFormat = NumberFormat('0.0');

  String getNoSeller(int index) {
    if (index == 0) return 'assets/icons/no01.png';
    if (index == 1) return 'assets/icons/no02.png';
    return 'assets/icons/no03.png';
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final widthUnit = (MediaQuery.of(context).size.width - 32) / 100;
    return StreamBuilder<List<TopSeller>>(
        stream: Provider.of<HomeBloc>(context).topSellerStream,
        builder: ((context, snapshot) {
          final List<TopSeller> topSellers;
          topSellers = snapshot.data ?? [];
          return Container(
            margin: const EdgeInsets.only(top: 2),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: ((21 + 24 + 68 + 1) *
                            (isExpanded ? topSellers.length : 3))
                        .toDouble(),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: topSellers.length,
                        itemBuilder: ((context, index) {
                          TopSeller seller = topSellers[index];
                          // print(seller);
                          String developStatus = seller.changeType == 'UP'
                              ? 'assets/icons/up.png'
                              : 'assets/icons/down.png';
                          TextStyle developStyle = TextStyle(
                              color: seller.changeType == 'UP'
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
                                SizedBox(
                                  width: 90 * widthUnit,
                                  child: Row(children: [
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
                                          seller.ranking.toString(),
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
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(34),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xffBBBBBB)
                                                            .withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 5,
                                                    offset: const Offset(2,
                                                        2), // changes position of shadow
                                                  ),
                                                ]),
                                            child: SizedBox(
                                              width: 68,
                                              height: 68,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(34),
                                                  child: CachedImageCustom(
                                                    seller.avatar,
                                                    boxFit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment:
                                                  const Alignment(0, 1.5),
                                              child: Image.asset(
                                                'assets/icons/add.png',
                                                width: 24,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 10.29,
                                            child: Image.asset(
                                              getNoSeller(index),
                                              width: 18.04,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            seller.userName.toUpperCase(),
                                            style: const TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3.69),
                                                  child: Image.asset(
                                                    'assets/icons/heart.png',
                                                    width: 14.31,
                                                  ),
                                                ),
                                                Text(
                                                  rateFormat.format(
                                                      seller.avarageRating ??
                                                          0),
                                                  style: const TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                ),
                                                const Text(' | '),
                                                Text(
                                                  seller.followCount
                                                          .toString() +
                                                      ' lượt theo dõi',
                                                  style: const TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Xem shop',
                                                  style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Image.asset(
                                                    'assets/icons/black_arrow.png',
                                                    width: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  // color: Colors.blue,
                                  // width: 10 * widthUnit,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Image.asset(
                                          developStatus,
                                          width: 8,
                                        ),
                                      ),
                                      Text(
                                        seller.changeValue.toString(),
                                        style: developStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                  GestureDetector(
                    onTap: () {
                      // print('tapped');
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: SizedBox(
                      height: 66,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 13.8),
                            child: Text(
                              isExpanded ? 'Rút gọn' : 'Xem thêm',
                              style: const TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          Image.asset(
                            isExpanded
                                ? 'assets/icons/collapse.png'
                                : 'assets/icons/see_more.png',
                            width: 8.4,
                          )
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
