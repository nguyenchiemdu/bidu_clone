import 'package:bidu_clone/common/asset_link.dart';
import 'package:flutter/material.dart';

import '../../../../common/font.dart';
import 'live_item.dart';

class BiduLive extends StatelessWidget {
  const BiduLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16, top: 30, bottom: 20),
            child: Image.asset(
              biduLive,
              height: 23,
            ),
          ),
          Container(
              height: 200.0,
              margin: const EdgeInsets.only(bottom: 30),
              child: ListView.builder(
                  itemCount: streamChannels.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    double marginLeft = index == 0 ? 16 : 0;
                    if (index < streamChannels.length) {
                      //TODO: Tach widget
                      return LiveItem(streamChannels[index], marginLeft);
                    } else {
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
                  }))
        ]),
      ),
    );
  }
}
