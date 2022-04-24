import 'package:flutter/material.dart';

import '../../../../common/cached_network_image.dart';

class BannerImage extends StatelessWidget {
  const BannerImage(this.imageUrl, {Key? key}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0), child: CachedImageCustom(imageUrl));
  }
}
