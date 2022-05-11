import 'package:bidu_clone/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/asset_link.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          onPressed: null,
          elevation: 0,
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    DesignColor.gradientPrimary2,
                    DesignColor.gradientPrimary1,
                  ]),
            )),
            Align(
                child: SvgPicture.asset(
                  AssetLink.navPlus,
                  color: Colors.white,
                  width: 20,
                ),
                alignment: Alignment.center),
          ]),
        ),
      ),
    );
  }
}
