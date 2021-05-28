import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest/models/postModel.dart';

class APIHelper {
  static int limit = 15, page =1;

  List<PostModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  }

  Future<List<PostModel>> fetchProducts() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_pages$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
