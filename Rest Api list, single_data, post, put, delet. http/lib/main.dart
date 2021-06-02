import 'package:flutter/material.dart'; 
import 'package:rest/Pages/CRUDPage.dart';
import 'package:rest/Pages/AllPosts.dart';
import 'package:rest/Pages/SinglePostComments.dart'; 

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('jsonplaceholder.typicode.com')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllPost())),
                child: Text('All Post\'s')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SinglePost())),
                child: Text('Single Post Comment\'s')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CRUDPage())),
                child: Text('Post, Put, Delete')),
          ],
        ),
      ),
    );
  }
}
