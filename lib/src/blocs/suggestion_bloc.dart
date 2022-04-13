import 'dart:async';

import 'dart:convert';

class SuggestionBloc {
  final StreamController<List?> _suggestionController =
      StreamController<List?>();
  get suggestionStream => _suggestionController.stream;
  void updateChange(respond) {
    Map data = jsonDecode(respond);
    List suggestion = data['data'] ?? [];
    _suggestionController.sink.add(suggestion);
  }

  void dispose() {
    _suggestionController.close();
  }
}
