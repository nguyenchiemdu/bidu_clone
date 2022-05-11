import 'package:bidu_clone/common/asset_link.dart';
import 'package:flutter/material.dart';

import '../../../../common/font.dart';
import 'live_item.dart';

// TODO: (Trung) tên class nên match với tên file DONE
// TODO : dat ten
class Live extends StatelessWidget {
  const Live({Key? key}) : super(key: key);
  Widget seeMoreLive() {
    return SizedBox(
      width: 140,
      child: Row(children: [
        Stack(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      //TODO : color
                      color: const Color(0xffFD374F),
                      width: 2,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(27)),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  arrow,
                  width: 21.14,
                ),
              ),
            ),
          ],
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Xem thêm',
            style: TextStyle(
                fontFamily: defaultFont,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ))
      ]),
    );
  }

  Widget biduLiveLogo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 16, top: 30, bottom: 20),
      child: Image.asset(
        biduLive,
        height: 23,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: (Trung) trang này chưa được refactor DONE
    const Map streamChannel = {
      'image': streamImage,
      'avatar': streamAvatar,
      'name': 'Phương Lê',
      'title': 'Sale off 30% to 50% for 21/04 - Fo...'
    };
    final List<Map> streamChannels = [
      streamChannel,
      streamChannel,
      streamChannel,
    ];
    return Container(
      color: const Color(0xffF5F5F5),
      child: SizedBox(
        child: Column(children: [
          biduLiveLogo(),
          Container(
              height: 200.0,
              margin: const EdgeInsets.only(bottom: 30),
              child: ListView.builder(
                  itemCount: streamChannels.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    double marginLeft = index == 0 ? 16 : 0;
                    if (index < streamChannels.length) {
                      //TODO: Tach widget DONE
                      return LiveItem(streamChannels[index], marginLeft);
                    } else {
                      return seeMoreLive();
                    }
                  }))
        ]),
      ),
    );
  }
}
