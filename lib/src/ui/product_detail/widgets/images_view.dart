import 'package:flutter/material.dart';

import '../../../../common/cached_network_image.dart';
import '../../../../common/colors.dart';
import '../../../../common/font.dart';

class ImagesView extends StatelessWidget {
  const ImagesView(
      this.images, this.imageSize, this.maximumItem, this.mainAxisSpacing,
      {Key? key})
      : super(key: key);
  final List<String> images;
  final int maximumItem;
  final double imageSize;
  final double mainAxisSpacing;
  int getItemCount(int length) {
    if (length > maximumItem) {
      return maximumItem;
    }
    return length;
  }

  int getNumberImagesLeft(int length) {
    if (length > maximumItem) {
      return length - maximumItem;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    int imagesLeft = getNumberImagesLeft(images.length);

    return Container(
      alignment: Alignment.centerLeft,
      height: imageSize,
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: getItemCount(images.length),
          itemBuilder: (_, index) {
            if (index < maximumItem - 1) {
              return Container(
                margin: EdgeInsets.only(right: mainAxisSpacing),
                child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: CachedImageCustom(
                      images[index],
                      boxFit: BoxFit.cover,
                    )),
              );
            } else {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: CachedImageCustom(
                        images[index],
                        boxFit: BoxFit.cover,
                      )),
                  imagesLeft > 0
                      ? Container(
                          width: imageSize,
                          height: imageSize,
                          color: DesignColor.textBlackColor.withOpacity(0.5),
                        )
                      : const SizedBox(),
                  imagesLeft > 0
                      ? Text(
                          '+$imagesLeft',
                          style: const TextStyle(
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
