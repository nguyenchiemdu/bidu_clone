import 'dart:async';

import 'dart:convert';

class BannerBloc {
  final StreamController<List?> _bannerController = StreamController<List?>();
  get bannerStream => _bannerController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List banners = data['data']['system_banner'] ?? [];
    _bannerController.sink.add(banners);
  }

  void dispose() {
    _bannerController.close();
  }
}
