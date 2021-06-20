import 'dart:convert';

import 'package:reqres/postRequest/PostReqModel.dart';
import 'package:http/http.dart' as http;

Future<PostRequestModel> getPostReq(String name, String job) async {
  final url = Uri.parse('https://reqres.in/api/users');

  final response = await http.post(url, body: {"name": name, "job": job});

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print(jsonDecode(responseString));
    return PostRequestModel.fromJson(jsonDecode(responseString));
  }
  return null;
}
