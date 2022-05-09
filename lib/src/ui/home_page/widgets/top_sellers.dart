import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:bidu_clone/src/ui/home_page/widgets/top_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';

class TopSellers extends StatefulWidget {
  const TopSellers({Key? key}) : super(key: key);

  @override
  State<TopSellers> createState() => _TopSellersState();
}

class _TopSellersState extends State<TopSellers> {
  bool isExpanded = false;
  String iconButton = seeMore;
  String textButton = 'Xem thêm';
  double getTopSellersHeight(List<TopSeller> topSellers) {
    int avatarHeight = 68;
    int paddingTop = 24;
    int paddingBottom = 21;
    int numberItems = (isExpanded ? topSellers.length : 3);
    return (avatarHeight + paddingTop + paddingBottom) * numberItems.toDouble();
  }

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
                        fontFamily: defaultFont,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    //TODO: animated size de tu dong thay doi chieu cao, dat const o tren, k su dung + DONE 1/2
                    height: getTopSellersHeight(topSellers),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: topSellers.length,
                        itemBuilder: ((context, index) {
                          TopSeller seller = topSellers[index];
                          // print(seller);
                          String developStatus =
                              seller.changeType == 'UP' ? up : down;
                          TextStyle developStyle = TextStyle(
                              color: seller.changeType == 'UP'
                                  ? const Color(0xff12B74A)
                                  : const Color(0xffFF3232),
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 12);
                          //TODO: tach DONE
                          return TopSellerItem(widthUnit, seller, index,
                              developStatus, developStyle);
                        })),
                  ),
                  GestureDetector(
                    onTap: () {
                      // print('tapped');
                      setState(() {
                        isExpanded = !isExpanded;
                        iconButton = isExpanded ? collapse : seeMore;
                        textButton = isExpanded ? 'Rút gọn' : 'Xem thêm';
                      });
                    },
                    //TODO: bam o ben ngoai xem them DONE
                    child: Container(
                      color: Colors.transparent,
                      height: 66,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 13.8),
                            child: Text(
                              textButton,
                              style: const TextStyle(
                                  fontFamily: defaultFont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          Image.asset(
                            //TODO: toan tu 3 ngoi de o ngoai widget DONE
                            iconButton,
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
