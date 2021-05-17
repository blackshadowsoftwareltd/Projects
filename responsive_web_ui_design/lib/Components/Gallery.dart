import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';

class Gallery extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
      return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: _width / 20),
          boldBlackText('Our Latest Screenshots Gallery'),
          SizedBox(height: _width / 20),
          normalBlackText(
              'Let\'s choose your favorite wallpapers and install now our free App and check out the amazing KTM Wallpaper. As a result, This is the best KTM Wallpaper App.'),
        ]),
      );


  }
}
