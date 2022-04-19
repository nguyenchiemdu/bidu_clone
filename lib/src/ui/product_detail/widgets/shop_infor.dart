import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const kAvatarSize = 36.0;

class ShopInFor extends StatelessWidget {
  const ShopInFor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              width: kAvatarSize,
              height: kAvatarSize,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/icons/shop_avatar.png'))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MUTINE',
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 9),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 14,
                            child: Image.asset('assets/icons/no01.png')),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '4.9',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 10,
                          color: const Color(0xffC4C4C4),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Tỷ lệ phản hồi Chat 95%',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          child: Column(children: [
            Container(
              height: 14,
              child: SvgPicture.asset(
                'assets/icons/nav_heart.svg',
                color: Color(0xffFD37AE),
              ),
            ),
            Text(
              '2.3k',
              style: TextStyle(
                  color: Color(0xffFD37AE),
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )
          ]),
        )
      ]),
    );
  }
}
