// To parse this JSON data, do
//
//     final earth = earthFromJson(jsonString);

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<Earth> fetchEarth() async {
//   final API_KEY = 'vSzhEzKj3qdWpQIn0ggfsKkk5rXlN2UPXPcbZshc';
//   final response = await http.get(Uri.parse(
//       'https://api.nasa.gov/planetary/earth/assets?lon=-95.33&lat=29.78&date=2018-01-01&&dim=0.10&api_key=$API_KEY'));
//   if (response.statusCode == 200) {
//     return Earth.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load Earth');
//   }
// }

class Earth {
  Earth({
    this.date,
    this.id,
    this.resource,
    this.serviceVersion,
    this.url,
  });

  DateTime date;
  String id;
  Resource resource;
  String serviceVersion;
  String url;

  factory Earth.fromJson(Map<String, dynamic> json) => Earth(
        date: DateTime.parse(json["date"]),
        id: json["id"],
        resource: Resource.fromJson(json["resource"]),
        serviceVersion: json["service_version"],
        url: json["url"],
      );
}

class Resource {
  Resource({
    this.dataset,
    this.planet,
  });

  String dataset;
  String planet;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        dataset: json["dataset"],
        planet: json["planet"],
      );
}
