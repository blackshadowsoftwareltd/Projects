import 'package:Quiz_Get_X/Screens/LandingPage.dart';
import 'package:Quiz_Get_X/Screens/QuizScreens/QuizScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData.dark(),
      home: LandingPage(),
    );
  }
}
