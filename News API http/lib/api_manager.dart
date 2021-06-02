import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news_model.dart';

class API_Manager {
  /// must need Uri.parse method.

  Future<NewsModel> getNews() async {
    var newsModel = null;
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=86d0d83e0c804ae6a2fec7ce236ffe12');
    var client = http.Client();
    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;

        /// print the json and copy the { to } and past it on https://app.quicktype.io/
        /// use 'NewsModel' as a class
        /// it will be model class
        //  print(jsonString);

        ///import 'dart:convert';
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
