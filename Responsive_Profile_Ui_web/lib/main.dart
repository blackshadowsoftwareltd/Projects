import 'package:flutter/material.dart';
import 'package:profile_web/Screens/ProfileScreen.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}
