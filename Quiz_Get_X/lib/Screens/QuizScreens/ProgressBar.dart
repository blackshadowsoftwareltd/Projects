import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../../Constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: .8),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              return Stack(children: [
                // LayoutBuilder provide us the available space for the conatiner
                // constraints.maxWidth needed for our animation
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                        // from 0 to 1 it takes 60s
                        width:
                            constraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(50)))),
                Positioned.fill(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${(controller.animation.value * 30).round()} / 30 second",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              Icon(Icons.timer, color: Colors.white, size: 25)
                            ])))
              ]);
            }));
  }
}
