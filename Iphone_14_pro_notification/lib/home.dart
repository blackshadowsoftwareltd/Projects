import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:iphone_14_pro_notification/helper/size.dart' show ScreenSize;

import 'widgets/popup.dart' show PopupBar;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: ScreenSize.width,
        height: ScreenSize.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [PopupBar()],
        ),
      ),
    );
    // return ColoredBox(
    //   color: Colors.blue,
    //   child: SizedBox(
    //     width: size.width,
    //     height: size.height,
    //   ),
    // );
  }
}
