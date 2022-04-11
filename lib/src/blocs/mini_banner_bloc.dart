import 'dart:async';

import 'dart:convert';

class MiniBannerBloc {
  final StreamController<List?> _miniBannerController =
      StreamController<List?>();
  get bannerStream => _miniBannerController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List banners = data['data'] ?? [];
    _miniBannerController.sink.add(banners);
  }

  void dispose() {
    _miniBannerController.close();
  }
}
