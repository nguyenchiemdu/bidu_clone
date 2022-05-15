import 'package:flutter/material.dart';

import '../../../../common/cached_network_image.dart';
import '../../../../common/colors.dart';
import '../../../../common/font.dart';

const kImageSize = 82.0;

class ImagesView extends StatelessWidget {
  const ImagesView(this.images, {Key? key}) : super(key: key);
  final List<String> images;
  int getItemCount(int length) {
    if (length > 4) {
      return 4;
    }
    return length;
  }

  int getNumberImagesLeft(int length) {
    if (length > 4) {
      return length - 4;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    int imagesLeft = getNumberImagesLeft(images.length);

    return SizedBox(
      height: kImageSize,
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: getItemCount(images.length),
          itemBuilder: (_, index) {
            if (index < 3) {
              return Container(
                margin: const EdgeInsets.only(right: 5),
                child: SizedBox(
                    width: kImageSize,
                    height: kImageSize,
                    child: CachedImageCustom(images[index])),
              );
            } else {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                      width: kImageSize,
                      height: kImageSize,
                      child: CachedImageCustom(images[index])),
                  imagesLeft > 0
                      ? Container(
                          width: kImageSize,
                          height: kImageSize,
                          color: DesignColor.textBlackColor.withOpacity(0.5),
                        )
                      : const SizedBox(),
                  imagesLeft > 0
                      ? const Text(
                          '+30',
                          style: TextStyle(
                              fontFamily: defaultFont,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white),
                        )
                      : const SizedBox()
                ],
              );
            }
          }),
    );
  }
}
