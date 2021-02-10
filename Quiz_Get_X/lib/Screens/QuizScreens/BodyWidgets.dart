import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:Quiz_Get_X/Screens/QuizScreens/ProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Constants.dart';
import 'QuestionCard.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Get X
    QuestionController _questionController = Get.put(QuestionController());
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressBar(),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 10),
              child: Obx(() => Text.rich(TextSpan(
                      text:
                          'Question ${_questionController.questionNumber.value} / ',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      children: [
                        TextSpan(
                            text: '${_questionController.questions.length}',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70))
                      ])))),
          Expanded(
              child: PageView.builder(
                  controller: _questionController.pageController,
                  itemCount: _questionController.questions.length,
                  onPageChanged: _questionController.updateTheQuestionNumber,
                  // scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index],
                      ))),
        ],
      ),
    );
  }
}
