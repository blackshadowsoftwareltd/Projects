import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:search_api/PostModel.dart';

List<PostModel> parsePost(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var posts = list.map((model) => PostModel.fromJson(model)).toList();
  return posts;
}

Future<List<PostModel>> fetchPost() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200)
    return compute(parsePost, response.body);
  else
    throw Exception('error');
}
