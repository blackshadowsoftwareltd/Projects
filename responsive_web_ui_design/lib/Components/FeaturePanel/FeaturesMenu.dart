import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';

class FeaturesMenu extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width / 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuItem('assets/icon/shopping_cart.png', 'Shopping Cart'),

            /// if(device is mobile)?
            SizedBox(height: 10),
            menuItem('assets/icon/package.png', 'Package'),

            /// if(device is mobile)?
            SizedBox(height: 10),
            menuItem('assets/icon/gift_packaging.png', 'Gift Package'),

            /// if(device is mobile)?
            SizedBox(height: 10),
            menuItem('assets/icon/delivery_time.png', '24h Delivery'),

            /// if(device is mobile)?
            SizedBox(height: 10),
            menuItem('assets/icon/payment_method.png', 'Easy Payment')
          ])
    );
  }

  Widget menuItem(String imgPath, String text) =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 50, child: Image.asset(imgPath)),
        menuText(text)
      ]);
}
