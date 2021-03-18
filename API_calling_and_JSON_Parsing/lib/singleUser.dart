import 'package:API_calling_and_JSON_Parsing/Services/http_service.dart';
import 'package:API_calling_and_JSON_Parsing/model/UserModel.dart';
import 'package:API_calling_and_JSON_Parsing/model/single_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SingleUserPage extends StatefulWidget {
  @override
  _SingleUserPageState createState() => _SingleUserPageState();
}

class _SingleUserPageState extends State<SingleUserPage> {
  HttpService http;
  Response response;
  SingleUserResponse singleUserResponse;
  UserModel userModel;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http = HttpService();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Get Single User')),
        body:

            /// This condition for checking connection
            isLoading
                ? Center(child: CircularProgressIndicator())
                : userModel != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.blue,
                                child: Image.network(userModel.avatar)),
                            SizedBox(height: 10),
                            Text(
                                'Hello ${userModel.firstName} ${userModel.lastName}'),
                            Text('email : ${userModel.email}'),
                            Text('ID : ${userModel.id}')
                          ],
                        ),
                      )
                    : Center(child: Text('No user')));
  }

  Future getUser() async {
    try {
      response = await http.getRequest('/api/users/1');
      isLoading = false;
      if (response.statusCode == 200)
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          userModel = singleUserResponse
              .user; // user is the object of SingleUserResponse class
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
