import 'package:Massage/services/service.dart';
import 'package:Massage/widget/CustomInput.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    String _logInMail = '';
    bool _success = true;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Password Recover'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomInput(
                  hintText: 'Enter a valid Mail',
                  eyeVisible: false,
                  onChanged: (value) {
                    _logInMail = value;
                  },
                  textInputAction: TextInputAction.next),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(_success == true ? '' : 'Failed! try again',
                    style: TextStyle(fontSize: 14)),
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  child: FlatButton(
                      child: Text('Password send by mail',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      onPressed: () {
                        final bool isValid =
                            EmailValidator.validate(_logInMail);
                        if (_logInMail != null) {
                          if (!isValid) {
                            setState(() {
                              _success = false;
                            });
                          } else {
                            Authenticators().resetPassword(_logInMail);
                          }
                        } else
                          setState(() {
                            _success = false;
                          });
                        print('pressed');
                      }))
            ])));
  }
}
