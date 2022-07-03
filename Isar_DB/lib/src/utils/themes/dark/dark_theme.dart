import 'package:flutter/material.dart'
    show Brightness, Colors, ThemeData, VisualDensity;

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
