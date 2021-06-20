import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reqres/putRequest/UpdateModel.dart';

Future<UpdateModel> getUpdate(String name, String job) async {
  final url = Uri.parse('https://reqres.in/api/users/2');

  final response = await http.put(url, body: {"name": name, "job": job});
  if (response.statusCode == 200) {
    final responseString = response.body;
    // print(responseString);
    return UpdateModel.fromJson(json.decode(responseString));
  }
  return null;
}
