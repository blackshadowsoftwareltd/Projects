import 'package:Quiz_Get_X/Constants.dart';
import 'package:Quiz_Get_X/Controller/QuestionController.dart';
import 'package:Quiz_Get_X/Models/Questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {
  const Option({
    this.index,
    this.text,
    this.press,
    Key key,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGreyColor;
          }

          getTheIcon() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Icon(Icons.done_outline);
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Icon(Icons.cancel);
              }
            }
            return null;
          }

          return InkWell(
            onTap: press,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: getTheColor())),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${index + 1}. $text',
                          style: TextStyle(color: getTheColor(), fontSize: 18)),
                      Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: getTheColor() == kGreyColor
                                ? Colors.transparent
                                : getTheColor(),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: getTheColor(), width: 2)),
                        child: getTheIcon(),
                      )
                    ])),
          );
        });
  }
}
