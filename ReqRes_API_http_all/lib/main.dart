import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reqres/SingleUserRequest/SingleUserPage.dart';
import 'ColorListRequest/ColorListPage.dart';
import 'putRequest/UpdatePage.dart';
import 'UserListReauest/UserListPage.dart';
import 'postRequest/PostPage.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => PostPage())),
                child: Text('Post Page')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => UpDatePage())),
                child: Text('Update Page')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => UserListPage())),
                child: Text('User List Page')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SingleUserPage())),
                child: Text('Single User Page')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ColorListPage())),
                child: Text('Color List Page')),
          ],
        ),
      ),
    );
  }
}
