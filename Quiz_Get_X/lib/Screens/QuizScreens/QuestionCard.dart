import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:Quiz_Get_X/Models/Questions.dart';
import 'package:flutter/material.dart';
import 'Option.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({@required this.question, Key key}) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(question.question,
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.black12,
              ),
              ...List.generate(
                  question.option.length,
                  (index) => Option(
                        index: index,
                        text: question.option[index],
                        press: () =>_controller.checkAns(question, index),
                      ))
            ]));
  }
}
