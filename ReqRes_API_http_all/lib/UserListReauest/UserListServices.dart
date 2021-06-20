import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reqres/UserListReauest/UserListModel.dart';

Future<UserListModel> getUserList(int page) async {
  page == null ?? 1;
  final url = Uri.parse('https://reqres.in/api/users?page=$page');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    String responseString = response.body;

    // print(jsonDecode(responseString));
    return UserListModel.fromJson(jsonDecode(responseString));
  }
  return null;
}
