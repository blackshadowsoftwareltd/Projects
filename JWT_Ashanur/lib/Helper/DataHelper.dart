import 'package:ashanur/Model/DataModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

List<UsersModel> parseUsers(String response) {
  var list = json.decode(response) as List<dynamic>;
  var user = list.map((userJson) => UsersModel.fromJson(userJson)).toList();
  return user;
}

Future<List<UsersModel>> getInfo() async {
  var url = Uri.parse(
      'https://jwt.dev-ashanur.com/api/student/info?fbclid=IwAR3-WY2aX7_zaW6uLPpDIbHDMY1HWOuA-6o8ScTvwUnwa7PUPPJuykhVs28');
  var response = await http.get(url);
  if (response.statusCode == 200)
    return compute(parseUsers, response.body);
  else
    throw Exception('error');
}
