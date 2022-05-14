import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages(this.images, {Key? key}) : super(key: key);
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CachedImageCustom(images[index]),
          );
        });
  }
}
