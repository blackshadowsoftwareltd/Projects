import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';
import 'package:responsive_web_ui_design/Services/PlatformServices.dart';

class HeaderPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: PlatFormServices.isMobile(context) ? 60 : 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: PlatFormServices.isMobile(context)
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              height: 40,
              child: Image.asset('assets/images/site_logo.png'))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: 150,
                    child: Image.asset('assets/images/site_logo.png'))),
                TextButton(onPressed: () {}, child: menuText('Home')),
                SizedBox(width: 20),
                TextButton(onPressed: () {}, child: menuText('Features')),
                SizedBox(width: 20),
                TextButton(onPressed: () {}, child: menuText('Screenshot')),
                SizedBox(width: 20),
                TextButton(onPressed: () {}, child: menuText('Gallery')),
              ],
            ),
    );
  }
}
