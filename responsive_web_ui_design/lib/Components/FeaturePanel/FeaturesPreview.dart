import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';

class FeaturesPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      itemImage('assets/icon/delivery_time.png'),
      SizedBox(height: 15),
      boldBlackText('24h Delivery times'),
      SizedBox(height: 10),
      normalBlackText(
          'Nunc accumsan hendrerit nunc. ac venenatis magna facitisus quis. Ut sit amet mi ac neque sodales facilisis. Nullam tempus fermentum lorem nec interdum. Ut id sapien imperdiet vehicula. Etiam quis dignissim ante. Donec convallis tincidunt ligula. ac luctus mi interdum a')
    ]));
  }

  Widget itemImage(String imgPath) =>
      SizedBox(height: 100, child: Image.asset(imgPath));
}
