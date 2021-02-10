import 'package:Massage/screen/signIn.dart';
import 'package:Massage/services/LandingPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'Message',
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
        // primarySwatch: Colors.blue[300],
        visualDensity: VisualDensity.adaptivePlatformDensity),
    home: LandingPage()));
