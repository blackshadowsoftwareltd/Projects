import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends ChangeNotifier {
  String uid, errorMessage, userMail;

  String get getErrorMessage => errorMessage;

  String get getUid => uid;

  String get getEmail => userMail;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginInToAccount(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    userMail = user.email;
    sharedPreferences.setString('uid', uid);
    sharedPreferences.setString('userMail', userMail);
    print('This is out uid >>>>>>>>>$getUid');
    notifyListeners();
  }

  Future createNewAccount(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    sharedPreferences.setString('uid', uid);
    print('This is out uid >>>>>>>>>$getUid');
    notifyListeners();
  }
}
