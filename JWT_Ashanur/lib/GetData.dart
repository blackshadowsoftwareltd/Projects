import 'package:ashanur/Helper/DataHelper.dart';
import 'package:ashanur/Model/DataModels.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GetDatas extends StatefulWidget {
  @override
  _GetDatasState createState() => _GetDatasState();
}

class _GetDatasState extends State<GetDatas> {
  List<UsersModel> userModel = List<UsersModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo().then((value) => setState(() => userModel.addAll(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: userModel.length,
            itemBuilder: (context, index) {
              if (userModel != null) {
                return contentTile(index);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget contentTile(int index) {
    var date = userModel[index].createdAt.split('-');
    var time = date[2].split('');

    return Container(
        color: Colors.grey[300],
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Name: ${userModel[index].name}',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Text('email: ${userModel[index].email}',
              style: TextStyle(fontSize: 15, color: Colors.black)),
          Text('roll: ${userModel[index].roll}',
              style: TextStyle(fontSize: 15, color: Colors.black)),
          Text('address: ${userModel[index].address}',
              style: TextStyle(fontSize: 15, color: Colors.black)),
          Text(
              'Created Date: ${time[0]}${time[1]}-${date[1]}-${date[0]}  Time: ${time[3]}${time[4]}:${time[6]}${time[7]}:${time[9]}${time[10]}',
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ]));
  }
}
