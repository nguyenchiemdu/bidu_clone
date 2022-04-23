import 'package:bidu_clone/common/cached_network_image.dart';
import 'package:bidu_clone/src/blocs/product_detail_bloc.dart';
import 'package:bidu_clone/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Product>(
        initialData: context.read<ProductDetailBloc>().product,
        stream: Provider.of<ProductDetailBloc>(context).productStream,
        builder: ((context, snapshot) {
          final List listImage = snapshot.data?.images ?? [];
          //TODO: aspecratio
          return SizedBox(
            height: 300,
            width: double.infinity,
            child: PageView.builder(
                itemCount: listImage.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(0),
                    child: SizedBox(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CachedImageCustom(
                          listImage[index],
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        }));
  }
}
