import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text('Message'),
  );
}

InputDecoration textFieldInputDecoration(String hintTxt) {
  return InputDecoration(
      hintText: hintTxt,
      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextFieldStyle(double txtSize) {
  return TextStyle(fontSize: txtSize, color: Colors.white, letterSpacing: .5);
}
