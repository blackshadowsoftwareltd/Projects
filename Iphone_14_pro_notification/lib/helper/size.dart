import 'package:flutter/material.dart';

class ScreenSize {
  static late double width;
  static late double height;
  static late double maxWidth;
  static late double minWidth;
  static late double maxHeight;
  static late double minHeight;

  static late double smallWidth;
  static late double smallHeight;
  static void init(BuildContext context) {
    final data = MediaQuery.of(context);
    width = data.size.width;
    height = data.size.height;
    maxWidth = width * .9;
    maxHeight = height * .3;
    minWidth = 22;
    minHeight = 22;
    smallWidth = width * .3;
    smallHeight = height * .1;
  }
}
