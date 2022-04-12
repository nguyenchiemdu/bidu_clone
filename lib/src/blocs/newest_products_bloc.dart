import 'dart:async';

import 'dart:convert';

class NewestProductBloc {
  final StreamController<List?> _newestProductsController =
      StreamController<List?>();
  get newestProductsStream => _newestProductsController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List newestProduct = data['data'] ?? [];
    _newestProductsController.sink.add(newestProduct);
  }

  void dispose() {
    _newestProductsController.close();
  }
}
