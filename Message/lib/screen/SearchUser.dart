import 'package:Massage/screen/conversation.dart';
import 'package:Massage/services/UserListDatabase.dart';
import 'package:Massage/services/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchUsers extends StatefulWidget {
  @override
  _SearchUsersState createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  UserListDatabase userListDatabase = UserListDatabase();
  TextEditingController searchTextEditingController = TextEditingController();
  QuerySnapshot searchSnapShot, friendSnapShot;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference friendListRef =
      FirebaseFirestore.instance.collection('UsersInFo');
  String uID, userName;
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.green[300]),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              _SearchBar(context),
              searching ? _SearchList(context) : _FriendList(context),
            ])));
  }



  Widget _SearchBar(BuildContext context) {
    return Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        color: Colors.green[300],
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width - 100,
                  alignment: Alignment.center,
                  child: TextField(
                      controller: searchTextEditingController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          hintText: 'Search by user Name',
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          border: InputBorder.none))),
              IconButton(
                  icon: Icon(Icons.search, size: 30, color: Colors.white),
                  onPressed: () {
                    userListDatabase
                        .getUserByUserName(searchTextEditingController.text)
                        .then((value) {
                      setState(() {
                        searching = true;
                        searchSnapShot = value;
                      });
                    });
                  })
            ]));
  }

  Widget _SearchList(BuildContext context) {
    return searchSnapShot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapShot.documents.length,
            itemBuilder: (context, index) {
              uID = searchSnapShot.documents[index].data()['userId'];
              // userName = searchSnapShot.documents[index].data()['userName'];
              return _UserTile(
                  searchSnapShot.documents[index].data()['userName'],
                  searchSnapShot.documents[index].data()['mail']);
            })
        : Container(
            padding: EdgeInsets.all(5), child: CircularProgressIndicator());
  }

  Widget _FriendList(BuildContext context) {
    userListDatabase.getFriendList().then((value) {
      setState(() {
        searching = false;
        friendSnapShot = value;
      });
    });
    return friendSnapShot != null
        ? ListView.builder(
        shrinkWrap: true,
        itemCount: searchSnapShot.documents.length,
        itemBuilder: (context, index) {
          uID = searchSnapShot.documents[index].data()['userId'];
          // userName = searchSnapShot.documents[index].data()['userName'];
          return _UserTile(
              searchSnapShot.documents[index].data()['userName'],
              searchSnapShot.documents[index].data()['mail']);
        })
        : Container(
            padding: EdgeInsets.all(5), child: CircularProgressIndicator());
  }

  Widget _UserTile(String FuserName, String FuserMail) {
    return uID != firebaseAuth.currentUser.uid
        ? Container(
            height: 50,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: FlatButton(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(FuserName,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                          Text(FuserMail,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ]),
                    Icon(Icons.send, size: 30, color: Colors.green[300])
                  ]),
              onPressed: (){},
            ))
        : Container();
  }

  _getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0))
      return '$b\_$a';
    else
      return '$a\_$b';
  }
}
