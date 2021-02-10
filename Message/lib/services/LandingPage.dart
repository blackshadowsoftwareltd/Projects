import 'package:Massage/screen/HomePage.dart';
import 'package:Massage/screen/signIn.dart';
import 'package:Massage/services/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Scaffold(
                body: Center(
                    child: Text('Error...${snapShot.error}',
                        style: Constants.regularHeading)));
          }
          if (snapShot.connectionState == ConnectionState.done) {
            // StreamBuilder can check the login state live
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapShot) {
                  // if Stream snapshot has error
                  if (streamSnapShot.hasError) {
                    return Scaffold(
                        body: Center(
                            child: Text('Error...${streamSnapShot.error}',
                                style: Constants.regularHeading)));
                  }
                  // Connection state active- Do the user login check inside the if statement
                  if (streamSnapShot.connectionState ==
                      ConnectionState.active) {
                    // Get the user
                    User _user = streamSnapShot.data;
                    // if user is null, we are logged in
                    if (_user == null) {
                      // user not logged in, head to login
                      /////////////////////////////////////////////////
                      return LogInPage();
                    } else {
                      // The user is logged in head to home page
                      return HomePage();
                    }
                  }

                  return Scaffold(
                      body: Center(child: Text('Checking Authincations...')));
                });
          }
          return Scaffold(body: Center(child: Text('Initialization...')));
        });
  }
}
