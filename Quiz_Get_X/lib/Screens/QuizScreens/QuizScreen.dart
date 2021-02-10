import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:Quiz_Get_X/Screens/QuizScreens/BodyWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[900],
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        FlatButton(
            child: Text('Skip',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1)),
            onPressed: () => _controller.nextQuestion())
      ]),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Body(),
      ),
    );
  }
}
