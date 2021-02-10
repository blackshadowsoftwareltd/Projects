

import 'package:Quiz_Get_X/Models/Questions.dart';
import 'package:Quiz_Get_X/Screens/Score/ScorePage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  /// so that we can access our animation outside
  Animation get animation => this._animation;

  List<Question> _question = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            option: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => this._question;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;
  int _correctAns;

  int get correctAns => this._correctAns;
  int _selectedAns;

  int get selectedAns => this._selectedAns;
  int _numberOfCorrectAns = 0;

  int get numberOfCorrectAns => this._numberOfCorrectAns;
  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  PageController _pageController;

  PageController get pageController => this._pageController;

  /// called immediately after the widget is allocated memory
  @override
  void onInit() {
    /// Our animation duration is 60 s
    /// so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        /// update like setState
        update();
      });

    /// Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    pageController.dispose();

    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numberOfCorrectAns++;
    _animationController.stop();
    update();
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _question.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }else
    Get.to(ScorePage());
  }

  updateTheQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
