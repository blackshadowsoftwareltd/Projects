import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Json Post Request')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: creatingAResource,
                child: Text('creating A Resource')),
            OutlinedButton(
                onPressed: updatingAResource,
                child: Text('updating A Resource')),
            OutlinedButton(
                onPressed: fatchingAResource,
                child: Text('fatching A Resource')),
            OutlinedButton(
                onPressed: deletingAResource,
                child: Text('deleting A Resource')),
          ],
        ),
      ),
    );
  }

  creatingAResource() async {
    await postData().then((value) => print(value));
  }

  updatingAResource() async {
    await updateData().then((value) => print(value));
  }

  fatchingAResource() async {
    await fatchData().then((value) => print(value));
  }

  deletingAResource() async {
    await deletData().then((value) => print(value));
  }

  Future postData() async {
    // final String path = 'https://jsonplaceholder.typicode.com/posts';
    final String path = 'https://jwt.dev-ashanur.com/api/student/info?fbclid=IwAR2jxPK7vnB3mQBfhowVhanP8rp98gOfpauwoBqvpfcz8RDcJQFsJ4UbLfg';
    // dynamic data = {
    //   'title': 'Flutter http post',
    //   'body': 'Creating A Resource',
    //   'userId': 1,
    // };
    dynamic data = {
      'id':7,
      'name': 'name',
      'email': 'email@ggggg.com',
      'address': 'address',
    };
    var response = await dio.post(path,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return response.data;
  }

  Future updateData() async {
    final String path = 'https://jsonplaceholder.typicode.com/posts/1';
    dynamic data = {
      'title': 'Flutter http update',
      'body': 'Updating A Resource',
      'userId': 12,
    };
    var response = await dio.put(path,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return response;
  }

  Future fatchData() async {
    final String path = 'https://jsonplaceholder.typicode.com/posts/1';
    dynamic data = {'title': 'Patch'};
    var response = dio.patch(path,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return response;
  }

  Future deletData() async {
    final String path = 'https://jsonplaceholder.typicode.com/posts/1';
    var response = dio.delete(path);
    return response;
  }
}
