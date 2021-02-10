import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LandingPage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text('Welcome',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.green[400],
                          fontWeight: FontWeight.w900))),
              FloatingActionButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  })
            ])))));
  }

// Future _usersDataStoring() async {
//   print('called..........................................');
//   print(usersDataRef);
//
//   return await FirebaseFirestore.instance
//       .collection('UsersInFo')
//       .doc(_firebaseAuth.currentUser.uid)
//       .set({
//     'userName': widget.name,
//     'contactNumber': widget.phone,
//     'address': widget.address,
//     'userId': _firebaseAuth.currentUser.uid,
//     'mail': widget.mail,
//     'password': widget.pass
//   });
//   print('success');
// }
}
