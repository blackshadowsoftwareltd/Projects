import 'package:API_calling_and_JSON_Parsing/UserListPage.dart';
import 'package:API_calling_and_JSON_Parsing/singleUser.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LandingPage()));

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Calling and JSON Parsing'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: 'null',
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleUserPage()))),
              FloatingActionButton(
                  heroTag: 'no',
                  child: Icon(
                    Icons.people,
                    size: 30,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserListPage()))),
            ],
          )),
    );
  }
}
