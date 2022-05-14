import 'package:flutter/material.dart';

import '../../../../common/asset_link.dart';
import '../../../../common/font.dart';

class LaundryInstruction extends StatelessWidget {
  LaundryInstruction({Key? key}) : super(key: key);
  final String arrowButton = AssetLink.collapse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: const Text(
                    'Hướng dẫn giặt ủi',
                    style: TextStyle(
                        fontFamily: defaultFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(width: 8, child: Image.asset(arrowButton))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
