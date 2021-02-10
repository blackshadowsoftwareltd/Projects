import 'package:Massage/screen/forgetPassword.dart';
import 'package:Massage/screen/signUp.dart';
import 'package:Massage/widget/CustomInput.dart';
import 'package:Massage/widget/customButton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _logInFormLoading = false;
  String _logInMail = '';
  String _logInPass = '';

  FocusNode _passFocusnode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passFocusnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passFocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text('Welcome User,\nLogin to your account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.green[400]))),
            Container(
                height: 400,
                padding: EdgeInsets.only(top: 100),
                child: Column(children: [
                  CustomInput(
                      hintText: 'Enter a valid Mail',
                      eyeVisible: false,
                      onChanged: (value) {
                        _logInMail = value;
                      },
                      onSubmit: (value) {
                        _passFocusnode.requestFocus();
                      },
                      textInputAction: TextInputAction.next),
                  CustomInput(
                      hintText: 'Enter your correct Password !',
                      focusNode: _passFocusnode,
                      eyeVisible: true,
                      onChanged: (value) {
                        _logInPass = value;
                      },
                      onSubmit: (vlaue) {
                        _submitForm();
                      }),
                  CustomButton(
                      text: 'Login',
                      outLineButton: false,
                      isLoading: _logInFormLoading,
                      onPresse: () {
                        mailValidator(_logInMail);

                        print('clicked on login button');
                      }),
                  CustomButton(
                      text: 'Forget Password',
                      onPresse: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                        print('Clicked on create an account button');
                      },
                      outLineButton: true)
                ])),
            Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CustomButton(
                    text: 'Create a new account',
                    onPresse: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                      print('Clicked on create an account button');
                    },
                    outLineButton: true))
          ])
        ])));
  }

  void _submitForm() async {
    setState(() {
      _logInFormLoading = true;
    });
    String _loginAccountFeedBack = await _logInAccount();
    if (_loginAccountFeedBack != null) {
      _alertDialogBuilder(_loginAccountFeedBack);
      setState(() {
        _logInFormLoading = false;
      });
    }
  }

  Future<String> _logInAccount() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _logInMail, password: _logInPass);
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

  Future<void> _alertDialogBuilder(String error) {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text('Error'),
              content: Container(
                child: Text(error),
              ),
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
}
