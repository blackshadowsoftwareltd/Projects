import 'dart:convert';
import 'package:http/http.dart' as http;

class SinglePostComment {
  SinglePostComment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory SinglePostComment.fromJson(Map<String, dynamic> json) =>
      SinglePostComment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
Future<SinglePostComment> fetchAlbum() async {
  int postId = 1;
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/$postId'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return SinglePostComment.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
