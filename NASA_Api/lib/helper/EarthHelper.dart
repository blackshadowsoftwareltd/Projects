import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nas/model/earthModel.dart';

Future<Earth> fetchEarth() async {
  final API_KEY = 'vSzhEzKj3qdWpQIn0ggfsKkk5rXlN2UPXPcbZshc';
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/planetary/earth/assets?lon=-95.33&lat=29.78&date=2018-01-01&&dim=0.10&api_key=$API_KEY'));
  if (response.statusCode == 200) {
    return Earth.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Earth');
  }
}