import 'package:API_calling_and_JSON_Parsing/Services/http_service.dart';
import 'package:API_calling_and_JSON_Parsing/model/UserModel.dart';
import 'package:API_calling_and_JSON_Parsing/model/list_user_response.dart';
import 'package:API_calling_and_JSON_Parsing/model/single_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/single_user_response.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserModel userModel;
  Response response;
  HttpService http;
  ListUserResponse listUserResponse;
  List<UserModel> allUsers;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http = HttpService();
    getListUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Users')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : allUsers != null
              ? ListView.builder(
                  itemCount: allUsers.length,
                  itemBuilder: (context, index) {
                    /// declaration for getting single index data
                    final user = allUsers[index];
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        leading: Image.network(user.avatar),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text('email : ${user.email}'),
                        onTap: () {},
                      ),
                    );
                  })
              : Center(child: Text('No users')),
    );
  }

  Future getListUsers() async {
    try {
      response = await http.getRequest('/api/users?page=1');
      isLoading = false;
      if (response.statusCode == 200)
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          allUsers = listUserResponse.users; // users is the object of UserModel class
          print('response OK');
        });
      else
        print('response Problem');
    } on DioError catch (e) {
      isLoading = false;
      print(e.toString());
    }
  }
}
