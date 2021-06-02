import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pex/Model/ReUsableModel.dart';

class SearchHelper {
  String API_KEY = '563492ad6f91700001000001ba4a863a870a4a1abb8a5aa80634ebaf';
  Future<ReUsableModel> getSearchImage(String QUERYTEXT) async {
    var searchUrl = Uri.parse(
        'https://api.pexels.com/v1/search?query=$QUERYTEXT&per_page=20&page=1');
    var searchModel = null;
    var client = http.Client();

    ///
    try {
      var response =
          await client.get(searchUrl, headers: {'Authorization': API_KEY});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        searchModel = ReUsableModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      throw Exception('error');
    }
    return searchModel;
  }
}
