
import 'package:flutter/material.dart';
import 'package:Quiz_Get_X/Constants.dart';
import 'package:get/get.dart';

import 'QuizScreens/QuizScreen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        height: _height,
        width: _width,
        alignment: Alignment.center,
        child: Container(
          height: 350,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Let\'s Play Quiz',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[900],
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w200),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: .5),
                                borderRadius: BorderRadius.circular(15)))),
                    Container(
                      width: _width,
                      height: 50,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: FlatButton(
                        child: Text(
                          'Let\'s Start',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizScreen()));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
