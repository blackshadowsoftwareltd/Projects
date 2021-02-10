import 'package:Massage/screen/conversation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  String userId, FUserId, FuserName, userName, userMail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: UserProfiles(), backgroundColor: Colors.green[300]),
      body: Container(
        alignment: Alignment.topCenter,
        child: _Frinds(context),
      ),
    );
  }

  Widget _Frinds(BuildContext context) {
    userId = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('UsersInFo').snapshots(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
                padding: EdgeInsets.all(10),
                children:
                    snapShot.data.docs.map((DocumentSnapshot documentSnapshot) {
                  return documentSnapshot.data()['userId'] !=
                          FirebaseAuth.instance.currentUser.uid
                      ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                    spreadRadius: 2)
                              ]),
                          child: FlatButton(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  documentSnapshot
                                                      .data()['userName'],
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  documentSnapshot
                                                      .data()['mail'],
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ]))
                                  ]),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConversationPage(
                                            FName: documentSnapshot
                                                .data()['userName'],
                                            FUserId: documentSnapshot
                                                .data()['userId'],
                                            userName: userName,
                                            userId: userId,
                                          )))))
                      : Container();
                }).toList());
          }
          return null;
        });
  }

  Widget UserProfiles() {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('UsersInFo')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          Map<String, dynamic> document = snapShot.data.data();
          userName = document['userName'] ?? '';
          userMail = document['mail'] ?? '';
          return Text(userName = document['userName'] ?? 'Loading.....');
        }
        return Text('Loading...');
      },
    );
  }
}
