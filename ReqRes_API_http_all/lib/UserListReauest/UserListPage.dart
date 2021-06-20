import 'package:flutter/material.dart';
import 'package:reqres/UserListReauest/UserListModel.dart';
import 'UserListServices.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  Future<UserListModel> userModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userModel = getUserList(1);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List Page')),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<UserListModel>(
                  future: userModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          color: Colors.grey[100],
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: Text(
                              'Page no: ${snapshot.data.page} \nPer Page: ${snapshot.data.perPage}  \nTotal: ${snapshot.data.total}  \nTotal Page: ${snapshot.data.totalPages}'));
                    }
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: CircularProgressIndicator());
                  }),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: FutureBuilder<UserListModel>(
                    future: userModel,
                    builder: (context, snapshot) {
                      // page = snapshot.data.page;
                      // perPage = snapshot.data.perPage;
                      // total = snapshot.data.total;
                      // totalPage = snapshot.data.totalPages;

                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            return contents(
                              snapshot.data.data[index].id,
                              snapshot.data.data[index].email,
                              snapshot.data.data[index].firstName,
                              snapshot.data.data[index].lastName,
                              snapshot.data.data[index].avatar,
                            );
                          },
                        );
                      }

                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contents(int id, String email, String firstName, String lastName,
          String imageUrl) =>
      Container(
        color: Colors.grey[300],
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(imageUrl), maxRadius: 50),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: $id'),
                  Text('Full Name: $firstName\t$lastName'),
                  Text('Email: $email')
                ],
              ),
            )
          ],
        ),
      );
}

// Text('Page no: $page \nPer Page: $perPage  \nTotal: $total  \nTotal Page: $totalPage')
