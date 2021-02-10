import 'package:Pizza/Provider/Authentication.dart';
import 'package:Pizza/screen/AdminLogin.dart';
import 'package:Pizza/screen/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

User currentUser;

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    var _marginTop = MediaQuery.of(context).size.height / 3;
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: _initialization,
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Scaffold(
                    body: Center(child: Text('Error...${snapShot.error}')));
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
                                child:
                                    Text('Error...${streamSnapShot.error}')));
                      }
                      // Connection state active- Do the user login check inside the if statement
                      if (streamSnapShot.connectionState ==
                          ConnectionState.active) {
                        // Get the user
                        currentUser = streamSnapShot.data;
                        // if user is null, we are logged in
                        if (currentUser == null) {
                          // user not logged in, head to login
                          /////////////////////////////////////////////////
                          return loginNow(context);
                        } else {
                          // The user is logged in head to home page
                          return HomePage();
                        }
                      }

                      return Scaffold(
                          body: Center(
                              child: Text('Checking Authentication...')));
                    });
              }
              return Scaffold(body: Center(child: Text('Initialization...')));
            }));
  }

  Widget loginNow(BuildContext context) {
    var _marginTop = MediaQuery.of(context).size.height / 3;
    return Container(
        margin: EdgeInsets.only(top: _marginTop - 50),
        child: Column(children: [
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: RichText(
                  text: TextSpan(
                      text: 'Pi',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'zz',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple)),
                    TextSpan(
                        text: 'a',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ]))),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.w600)),
                        onPressed: () => loginSheet(context)),
                    MaterialButton(
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.w600)),
                        onPressed: () => signUpSheet(context))
                  ])),

        ]));
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.deepPurple[300]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextField(
                                controller: emailController,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18))),
                            TextField(
                                controller: passwordController,
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18))),
                          ]),
                    ),
                    MaterialButton(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        onPressed: () {
                          Provider.of<Authentication>(context, listen: false)
                              .loginInToAccount(emailController.text,
                                  passwordController.text);
                          Navigator.pop(context);
                        })
                  ]));
        });
  }

  signUpSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.deepPurple[100]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextField(
                                controller: emailController,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18))),
                            TextField(
                                controller: passwordController,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18))),
                          ]),
                    ),
                    MaterialButton(
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        onPressed: () {
                          Provider.of<Authentication>(context, listen: false)
                              .createNewAccount(emailController.text,
                                  passwordController.text);
                          Navigator.pop(context);
                        })
                  ]));
        });
  }
}
