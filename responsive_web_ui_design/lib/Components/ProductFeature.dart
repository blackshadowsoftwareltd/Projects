import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';

class ProductFeature extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width,
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.blue[100],
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KTM Wallpaper',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            letterSpacing: .3)),
                    Divider(height: 10, thickness: 2, color: Colors.blue[300]),
                    normalBlackText(
                        'About APP\nThis App is a different collection of all kinds of cool KTM Bike wallpapers. Here are many types of wallpapers. like KTM RC, KTM DUKE, KTM Adventure, and off-road bike, etc. KTM\'s Every image is awesome and incredible. If you are looking for the best KTM sports bike wallpaper. you are in absolutely the right place. because our KTM motorcycle wallpapers are beautiful and amazing. Inside our app, you will found a lot of colorful and clear KTM Bike Images.'),
                    learnMoreButton('LEARN MORE')
                  ])),
          Expanded(flex: 1, child: Images())
        ]));
  }

  Widget Images() => SizedBox(
      height: _width / 4,
      child: Image.asset('assets/images/ktm_wallpaper.png'));

  Widget learnMoreButton(String text) => Container(
      width: _width / 7,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: _width / 100),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: Colors.white.withOpacity(.5), width: _width / 500)),
      alignment: Alignment.center,
      child: Text('$text',
          style: TextStyle(color: Colors.white, fontSize: _width / 60)));
}
