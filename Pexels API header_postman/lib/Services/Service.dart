import 'package:flutter/cupertino.dart';

class Service with ChangeNotifier {
  String apiLink =
      'https://api.pexels.com/v1/curated?page=1&per_page=20&query=sky';

  String get getAPILink => apiLink;

  void setLink(String QUERYTEXT) {
    apiLink = QUERYTEXT != ''
        ? 'https://api.pexels.com/v1/search?query=$QUERYTEXT&per_page=20&page=1'
        : 'https://api.pexels.com/v1/curated?page=1&per_page=20&query=sky';
    notifyListeners();
  }
}
