import 'dart:async';

import 'dart:convert';

class TopProductBloc {
  final StreamController<List?> _topProductsController =
      StreamController<List?>();
  get topProductsStream => _topProductsController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List topProduct = data['data'] ?? [];
    _topProductsController.sink.add(topProduct);
  }

  void dispose() {
    _topProductsController.close();
  }
}
