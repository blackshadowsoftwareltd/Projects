import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

class CRUDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Buttons('Post', postMethod),
            Buttons('Put', putMethod),
            Buttons('Delet', deletMethod),
          ],
        ),
      ),
    );
  }

  Widget Buttons(String title, Function function) =>
      OutlinedButton(onPressed: function, child: Text(' $title '));

  Future postMethod() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    String title = 'titles', body = 'This is the body';
    int id = 1;

    final http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, dynamic>{'title': title, 'body': body, 'userId': id}));
    if (response.statusCode == 201) {
      print('success');
    } else
      throw Exception('Failed to Post Data');
  }

  Future putMethod() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final http.Response response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'id': 1,
          'title': 'foo',
          'body': 'bar',
          'userId': 1
        }));
    if (response.statusCode == 200)
      print('Success');
    else
      throw Exception('Failes to update Data');
  }

  Future deletMethod() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final http.Response response = await http.delete(url, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200)
      print('Success');
    else
      throw Exception('Failed to delete Post');
  }
}
