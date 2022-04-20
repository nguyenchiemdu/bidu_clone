import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCustom extends StatelessWidget {
  const CachedImageCustom(this.url,
      {Key? key, this.boxFit, this.circleSize = 30})
      : super(key: key);
  final String url;
  final BoxFit? boxFit;
  final double circleSize;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          width: circleSize,
          height: circleSize,
          child: CircularProgressIndicator(
              color: const Color(0xffE812A4), value: downloadProgress.progress),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
