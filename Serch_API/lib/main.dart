import 'package:flutter/material.dart';
import 'package:search_api/PostModel.dart';

import 'Services.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel> _posts = List<PostModel>();
  List<PostModel> _postDesplay;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchPost().then((value) {
      setState(() {
        isLoading = false;
        _posts.addAll(value);
        _postDesplay = _posts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          if (!isLoading)
            return index == 0 ? searching() : contentCard(index - 1);

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget contentCard(int index) => Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        color: Colors.grey[300],
        child: Column(
          children: [
            Text(_posts[index].title),
            Divider(height: 5, thickness: 1, color: Colors.grey[600]),
            Text(_posts[index].body),
          ],
        ),
      );
  searching() => Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(hintText: 'Search...'),
          onChanged: (txt) {
            print(txt);
            txt = txt.toLowerCase();
            setState(() {
              _postDesplay = _posts.where((x) {
                var postTitle = x.title.toLowerCase();
                print(postTitle.contains(txt));
                return postTitle.contains(txt);
              }).toList();
            });
          },
        ),
      );
}
