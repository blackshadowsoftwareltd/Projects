import 'package:Massage/services/LoadingPage.dart';
import 'package:Massage/widget/CustomInput.dart';
import 'package:Massage/widget/customButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //default form loading state
  bool _registerFormLoading = false;

//form input field values
  static String _registerMail,
      _registerPass,
      _registerName,
      _registerPhone,
      _registerAddress;

  // focusNode for input field
  FocusNode _passFocusNode;
  FocusNode _mailFocusNode;
  FocusNode _phoneFocusNode;
  FocusNode _addressFocusNode;

  UserCredential authResult;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final CollectionReference usersDataRef =
      FirebaseFirestore.instance.collection('UsersData');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passFocusNode = FocusNode();
    _mailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passFocusNode.dispose();
    _mailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 5),
                child: Text('Welcome,\nRegister as a new user',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.green[400]))),
            Container(
                height: 500,
                padding: EdgeInsets.only(top: 50),
                child: Column(children: [
                  CustomInput(
                    hintText: 'Full name',
                    eyeVisible: false,
                    onChanged: (value) {
                      _registerName = value;
                    },
                    onSubmit: (value) {
                      _phoneFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: 'Contact Number',
                    eyeVisible: false,
                    onChanged: (value) {
                      _registerPhone = value;
                    },
                    onSubmit: (value) {
                      _addressFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  CustomInput(
                    hintText: 'Address',
                    eyeVisible: false,
                    onChanged: (value) {
                      _registerAddress = value;
                    },
                    onSubmit: (value) {
                      _mailFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: 'Enter a valid Mail!',
                    eyeVisible: false,
                    onChanged: (value) {
                      _registerMail = value;
                    },
                    onSubmit: (value) {
                      _passFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                      hintText: 'Enter your correct Password!',
                      focusNode: _passFocusNode,
                      eyeVisible: true,
                      onChanged: (value) {
                        _registerPass = value;
                      },
                      onSubmit: (vlaue) {
                        _submitForm();
                      }),
                  CustomButton(
                      text: 'Register',
                      outLineButton: false,
                      isLoading: _registerFormLoading,
                      onPresse: () {
                        if (_registerName == null) {
                          _alertDialogBuilder('Name Field is empty');
                        } else if (_registerPhone == null) {
                          _alertDialogBuilder('Contact Number field is empty');
                        } else if (_registerAddress == null) {
                          _alertDialogBuilder('Address Field is empty');
                        } else if (_registerMail == null) {
                          _alertDialogBuilder('Mail field is empty');
                        } else if (_registerPass == null) {
                          _alertDialogBuilder('Password Field is empty');
                        } else {
                          mailValidator(_registerMail);
                          // _addToCart();
                          // _usersDataStoring();
                          print('clicked on Register button');
                        }

                        // _usersDataStoring();
                      })
                ])),
            Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CustomButton(
                    text: 'Already have an account',
                    onPresse: () {
                      Navigator.pop(context);
                      print('Clicked on Already have an account');
                    },
                    outLineButton: true))
          ])
        ])));
  }

  // alertDialog for display some error
  Future<void> _alertDialogBuilder(String error) async {
    //built an alert dialog to display some error
    return showDialog(
        context: context,
        barrierColor: Colors.grey[700],
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text('Error'),
              content: Container(child: Text(error)),
              actions: [
                FlatButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  mailValidator(String x) {
    final bool isValid = EmailValidator.validate(x);
    if (!isValid) {
      showToast('Enter a valid mail',
          duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
    } else {
      _submitForm();
    }
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void _submitForm() async {
    // setState for loading start
    setState(() {
      _registerFormLoading = true;
    });
    // Run create account method
    String _createAccountFeedback = await _createAccount();
    //if the string is not null, we got error  while create account
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      // setState for loading off
      setState(() {
        _registerFormLoading = false;
        // _usersDataStoring();
      });
    } else {
      //if String in null, user is logged in, head back to login page.

      setState(() {
        _usersDataStoring();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoadingPage()));
      });
    }
  }

  // create a new user account
  Future<String> _createAccount() async {
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerMail, password: _registerPass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future _usersDataStoring() async {
    print('called..........................................');
    print(usersDataRef);

    return await FirebaseFirestore.instance
        .collection('UsersInFo')
        .doc(_firebaseAuth.currentUser.uid)
        .set({
      'userName': _registerName,
      'contactNumber': _registerPhone,
      'address': _registerAddress,
      'userId': _firebaseAuth.currentUser.uid,
      'mail': _registerMail,
      'profileImage': 'null',
      'password': _registerPass
    });
    print('success');
  }
}
