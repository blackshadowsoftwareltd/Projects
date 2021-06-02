// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:pex/Services/Service.dart';
// import 'dart:convert';
// import 'package:provider/provider.dart';
// import 'package:pex/Model/ReUsableModel.dart';
//
// class ReUsableHelper {
//   String API_KEY = '563492ad6f91700001000001ba4a863a870a4a1abb8a5aa80634ebaf';
//
//   Future<ReUsableModel> getImage(BuildContext context, String QUERYTEXT) async {
//     ///
//     // var url = QUERYTEXT != ''
//     //     ? Uri.parse(
//     //         'https://api.pexels.com/v1/search?query=$QUERYTEXT&per_page=20&page=1')
//     //     : Uri.parse(
//     //     'https://api.pexels.com/v1/curated?page=1&per_page=20&query=sky');
//
//     // var searchUrl = Uri.parse(
//     //     'https://api.pexels.com/v1/search?query=$QUERYTEXT&per_page=20&page=1');
//     // var curatedURL = Uri.parse(
//     //     'https://api.pexels.com/v1/curated?page=1&per_page=20&query=sky');
//     Provider.of<Service>(context, listen: false).setLink(QUERYTEXT);
//     String data = Provider.of<Service>(context, listen: false).getAPILink;
//     var url = Uri.parse(data);
//     print(url);
//
//     var reUsableModel = null;
//     var client = http.Client();
//
//     ///
//     try {
//       var response = await client.get(url, headers: {'Authorization': API_KEY});
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);
//         reUsableModel = ReUsableModel.fromJson(jsonMap);
//       }
//     } catch (Exception) {
//       throw Exception('error');
//     }
//     return reUsableModel;
//   }
// }
