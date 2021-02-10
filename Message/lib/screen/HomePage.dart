import 'package:Massage/screen/FriendsList.dart';
import 'package:Massage/widget/ConversationHistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String userId,userName,userMail;

  @override
  Widget build(BuildContext context) {
    userId = _firebaseAuth.currentUser.uid;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(context),
      body: ConversationHistory(),
      floatingActionButton: _FloatingActionButton(context),
    );
  }

  Widget _FloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.green[300],
        child: Icon(
          Icons.people_outlined,
          size: 35,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => FriendList())));
  }

  Widget _AppBar(BuildContext context) {
    return AppBar(
        title: UserProfiles(),
        backgroundColor: Colors.green[300],
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () => _firebaseAuth.signOut())
        ]);
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
