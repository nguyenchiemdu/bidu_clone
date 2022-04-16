import 'package:flutter/material.dart';

class BiduLive extends StatelessWidget {
  const BiduLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map streamChannel = {
      'image': 'assets/images/live_1.png',
      'avatar': 'assets/images/avatar_live.png',
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
      child: Container(
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16, top: 30, bottom: 20),
            child: Image.asset(
              'assets/icons/bidu_live.png',
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
                    if (index < streamChannels.length) {
                      return Container(
                        width: 140,
                        margin: EdgeInsets.only(
                            right: 10, left: index == 0 ? 16 : 0),
                        child: Stack(
                          children: [
                            Image.asset(
                              streamChannels[index]['image'],
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
                                          border: Border.all(
                                              color: const Color(0xffE812A4)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            streamChannels[index]['avatar'],
                                            width: 28,
                                            height: 28,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          streamChannels[index]['name'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Lexend',
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 3.0,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              // Shadow(
                                              //   offset: Offset(10.0, 10.0),
                                              //   blurRadius: 8.0,
                                              //   color: Color.fromARGB(
                                              //       125, 0, 0, 255),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    streamChannels[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2, 2),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        // Shadow(
                                        //   offset: Offset(10.0, 10.0),
                                        //   blurRadius: 8.0,
                                        //   color: Color.fromARGB(
                                        //       125, 0, 0, 255),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 9, top: 8),
                              width: 12,
                              height: 12,
                              child:
                                  Image.asset('assets/icons/signal_column.png'),
                            )
                          ],
                        ),
                      );
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
                                    'assets/icons/arrow.png',
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
                                  fontFamily: 'Lexend',
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
