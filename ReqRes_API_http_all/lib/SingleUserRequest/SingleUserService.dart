import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SingleUserModel.dart';

Future<SingleUserModel> getUserData() async {
  final url = Uri.parse('https://reqres.in/api/users/5');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final responseString = response.body;
    // print(responseString);
    return SingleUserModel.fromJson(json.decode(responseString));
  }
  return null; 
}
