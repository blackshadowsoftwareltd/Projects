import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reqres/ColorListRequest/ColorListModel.dart';

Future<ColorModel> getColors() async {
  final url = Uri.parse('https://reqres.in/api/unknown?per_page=20&page=1&total=20&total_pages=2');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final responseString = response.body;
    // print(responseString);
    return ColorModel.fromJson(json.decode(responseString));
  }
  return null;
}
