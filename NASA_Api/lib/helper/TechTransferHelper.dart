import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nas/model/TechTransfer.dart';

class TechTransferHelper {
  Future<TechTransferModel> getInfo() async {
    var techModel = null;
    String API_KEY = 'vSzhEzKj3qdWpQIn0ggfsKkk5rXlN2UPXPcbZshc';
    var url = Uri.parse(
        'https://api.nasa.gov/techtransfer/patent/?engine&api_key=$API_KEY');
    var client = http.Client();
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;

        var jsonMap = json.decode(jsonString);
        techModel = TechTransferModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return techModel;
    }
    return techModel;
  }
}
