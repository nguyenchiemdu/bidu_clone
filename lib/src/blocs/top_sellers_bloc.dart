import 'dart:async';

import 'dart:convert';

class TopSellersBloc {
  final StreamController<List?> _topSellersController =
      StreamController<List?>();
  get topSellersStream => _topSellersController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List topSellers = data['data'] ?? [];
    _topSellersController.sink.add(topSellers);
  }

  void dispose() {
    _topSellersController.close();
  }
}
