import 'package:flutter/material.dart';

Widget menuText(String title) => Text(title,
    style: TextStyle(
        fontSize: 22, color: Colors.grey[700], fontWeight: FontWeight.w200),
    textAlign: TextAlign.center);

Widget boldWhiteText(String title) => Text(title,
    style: TextStyle(
        fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center);

Widget boldBlackText(String title) => Text(title,
    style: TextStyle(
        fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center);

Widget normalWhiteText(String title) => Text(title,
    style: TextStyle(
        fontSize: 12,
        color: Colors.white.withOpacity(.6),
        fontWeight: FontWeight.w200),
    textAlign: TextAlign.center);

Widget normalBlackText(String title) => Text(title,
    style: TextStyle(
        fontSize: 12,
        color: Colors.black.withOpacity(.4),
        fontWeight: FontWeight.w200),
    textAlign: TextAlign.center);
