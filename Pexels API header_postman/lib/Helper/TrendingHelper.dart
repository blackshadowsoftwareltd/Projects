import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pex/Model/ReUsableModel.dart';

class TrendingHelper {
  String API_KEY = '563492ad6f91700001000001ba4a863a870a4a1abb8a5aa80634ebaf';
  var curatedURL = Uri.parse(
      'https://api.pexels.com/v1/curated?page=1&per_page=20&query=sky');

  ///
  Future<ReUsableModel> getTrendingImages() async {
    var trendingModel = null;
    var client = http.Client();

    ///
    try {
      var response =
          await client.get(curatedURL, headers: {'Authorization': API_KEY});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        trendingModel = ReUsableModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      throw Exception('error');
    }
    return trendingModel;
  }
}
