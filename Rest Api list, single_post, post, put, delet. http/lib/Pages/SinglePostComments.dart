import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

int postNumber = 1;

class SinglePost extends StatefulWidget {
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  Future<SinglePostComment> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Post comment'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<SinglePostComment>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CommentData(snapshot.data.id, snapshot.data.name,
                  snapshot.data.email, snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget CommentData(int postId, String name, String email, String body) =>
      Container(
          height: 200,
          margin: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('post number: $postId'),
                Text('comment name: $name'),
                Text('comment email: $email'),
                Text('comment body: $body')
              ]));
}

Future<SinglePostComment> fetchAlbum(BuildContext context) async {
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
