import 'package:PhoneTesting/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<FirebaseApp> _inintialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _inintialization,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Scaffold(body: Center(child: Text(snapShot.error)));
          }
          if (snapShot.connectionState == ConnectionState.done) {
            return HomePage();
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        });
  }
}
