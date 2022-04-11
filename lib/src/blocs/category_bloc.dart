import 'dart:async';

import 'dart:convert';

class CategoryBloc {
  final StreamController<List?> _categoryController = StreamController<List?>();
  get categoryStream => _categoryController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List categories = data['data'] ?? [];
    _categoryController.sink.add(categories);
  }

  void dispose() {
    _categoryController.close();
  }
}
