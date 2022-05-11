import 'package:bidu_clone/common/number_format.dart';
import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/models/top_seller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/asset_link.dart';
import '../../../../common/cached_network_image.dart';
import '../../../../common/font.dart';

class TopSellerItem extends StatelessWidget {
  const TopSellerItem(this.widthUnit, this.seller, this.index,
      this.developStatus, this.developStyle,
      {Key? key})
      : super(key: key);
  final double widthUnit;
  final TopSeller seller;
  final int index;
  final String developStatus;
  final TextStyle developStyle;

  Widget rankingNumber() {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: Text(
          seller.ranking.toString(),
          style: const TextStyle(
              color: Colors.white,
              fontFamily: defaultFont,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget sellerImage() {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(34), boxShadow: [
        BoxShadow(
          color: const Color(0xffBBBBBB).withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(2, 2), // changes position of shadow
        ),
      ]),
      child: SizedBox(
        width: 68,
        height: 68,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(34),
            child: CachedImageCustom(
              seller.avatar,
              boxFit: BoxFit.fill,
            )),
      ),
    );
  }

  Widget addSellerButton() {
    return Positioned.fill(
      child: Align(
        alignment: const Alignment(0, 1.5),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: const Color(0xffBBBBBB).withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ]),
          child: Image.asset(
            addSeller,
            width: 24,
          ),
        ),
      ),
    );
  }

  Widget sellerAvatar(HomeBloc homeBloc) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          sellerImage(),
          //TODO: them bong do DONE
          addSellerButton(),
          Positioned(
            top: 0,
            right: 10.29,
            child: Image.asset(
              homeBloc.getNoSeller(index),
              width: 18.04,
            ),
          )
        ],
      ),
    );
  }

  Widget sellerName() {
    return Text(
      seller.userName.toUpperCase(),
      style: const TextStyle(
          fontFamily: defaultFont, fontWeight: FontWeight.w700, fontSize: 14),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget sellerRateFollow() {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.69),
            child: Image.asset(
              sellerHeart,
              width: 14.31,
            ),
          ),
          Text(
            // TODO: (Trung) nên viết thành 1 extension của NumberFormat DONE
            // TODO: Extension research
            rateFormat(seller.avarageRating ?? 0),
            style: const TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
          const Text(' | '),
          Text(
            seller.followCount.toString() + ' lượt theo dõi',
            style: const TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget seeShop() {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: Row(
        children: [
          const Text(
            'Xem shop',
            style: TextStyle(
                fontFamily: defaultFont,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              blackArrow,
              width: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget movementWidget() {
    return Expanded(
      // color: Colors.blue,
      // width: 10 * widthUnit,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Tach wiget thanh cac ham return ve widget DONE
    final HomeBloc homeBloc = context.read<HomeBloc>();
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
              rankingNumber(),
              sellerAvatar(homeBloc),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [sellerName(), sellerRateFollow(), seeShop()],
                ),
              ),
            ]),
          ),
          movementWidget()
        ],
      ),
    );
  }
}
