import 'package:Pizza/Provider/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'AdminPage.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final String pass = '1234';
  String passValue;
  bool loginNow = false;

  User currentUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          loginNow == false
              ? Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Enter Admin password'),
                            onChanged: (value) {
                              passValue = value;
                            }),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: FloatingActionButton(
                                child: Icon(Icons.arrow_forward_ios, size: 25),
                                onPressed: () {
                                  if (passValue == pass) {
                                    setState(() {
                                      loginNow = true;
                                    });
                                  }
                                }))
                      ]))
              : StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, streamSnapShot) {
                    // if Stream snapshot has error
                    if (streamSnapShot.hasError) {
                      return Scaffold(
                          body: Center(
                              child: Text('Error...${streamSnapShot.error}')));
                    }
                    // Connection state active- Do the user login check inside the if statement
                    if (streamSnapShot.connectionState ==
                        ConnectionState.active) {
                      // Get the user
                      currentUser = streamSnapShot.data;
                      // if user is null, we are logged in
                      if (currentUser != null && pass == passValue) {
                        /////////////////////////////////////////////////
                        return AdminPage();
                      } else {
                        // The user is logged in head to home page
                        return login(context);
                      }
                    }

                    return Scaffold(
                        body:
                            Center(child: Text('Checking Authentication...')));
                  })
        ])));
  }

  Widget login(BuildContext context) {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Admin Panel',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              ])
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
