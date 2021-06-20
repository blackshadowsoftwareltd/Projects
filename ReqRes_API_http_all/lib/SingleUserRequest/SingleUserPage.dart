import 'dart:ui';
import 'package:flutter/material.dart';
import 'SingleUserModel.dart';
import 'SingleUserService.dart';

class SingleUserPage extends StatefulWidget {
  @override
  _SingleUserPageState createState() => _SingleUserPageState();
}

class _SingleUserPageState extends State<SingleUserPage> {
  Future<SingleUserModel> singleModel = getUserData();
Future <SingleUserModel> userModel;
  @override
  Widget build(BuildContext context) { 
 
    return Scaffold(
        appBar: AppBar(title: Text('Single User Post')),
        body: Container(
            child: FutureBuilder<SingleUserModel>(
                future: singleModel,
                builder: (context, snapshot) {
                  // print(snapshot.data.data);
                  if (snapshot.hasError)
                    return Text(snapshot.error);
                  else if (snapshot.hasData)
                    return contents(
                        snapshot.data.data.id,
                        snapshot.data.data.email,
                        snapshot.data.data.firstName,
                        snapshot.data.data.lastName,
                        snapshot.data.data.avatar,
                        snapshot.data.support.url,
                        snapshot.data.support.text);
                  return Center(child: CircularProgressIndicator());
                })));
  }

  Widget contents(int id, String email, String fName, String lName,
          String imageUrl, String url, String text) =>
      Container(
        color: Colors.grey[100],
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            profileImage(imageUrl),
            sText('ID: $id'),
            sText('Email: $email'),
            zText('Name: $fName $lName'),
            Divider(height: 20, thickness: .5),
            sText('Support:\n$url'),
            sText(text),
          ],
        ),
      );
  Widget zText(String label) => Text(label, style: TextStyle(fontSize: 20));
  Widget sText(String label) => Text(
        label,
      );
  Widget profileImage(String url) =>
      CircleAvatar(radius: 60, backgroundImage: NetworkImage(url));
}
