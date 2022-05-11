import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';

class LiveItem extends StatelessWidget {
  const LiveItem(this.streamChannel, this.marginLeft, {Key? key})
      : super(key: key);
  final Map streamChannel;
  final double marginLeft;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 10, left: marginLeft),
      child: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              streamChannel['image'],
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xff000000),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 6, bottom: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffE812A4)),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          streamChannel['avatar'],
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: Text(
                          streamChannel['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: defaultFont,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  streamChannel['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: defaultFont,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 9, top: 8),
            width: 12,
            height: 12,
            child: Image.asset(AssetLink.signalColumn),
          )
        ],
      ),
    );
  }
}
