import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text('Score',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              Spacer(
                flex: 1,
              ),
              Text(
                  '${_controller.correctAns * 10} / ${_controller.questions.length * 10}',
                  style: TextStyle(fontSize: 35, color: Colors.white)),
              Spacer(
                flex: 3,
              )
            ],
          )
        ],
      ),
    );
  }
}
