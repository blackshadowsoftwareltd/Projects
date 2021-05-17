import 'package:flutter/material.dart';

import 'package:responsive_web_ui_design/Reusable_Components/texts.dart';

import 'FeaturesMenu.dart';
import 'FeaturesPreview.dart';

class Features extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(

        /// condition
        //  if(! mobile) padding: EdgeInsets.symmetric(horizontal: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      featureTitle(),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: FeaturesMenu()),
            Container(
              width: 5,
              height: 300,
              color: Colors.grey[300],
            ),
            Expanded(flex: 1, child: FeaturesPreview())
          ])
    ]));
  }

  Widget featureTitle() => Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: _width / 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        boldBlackText('Heading Feature title goes here'),
        SizedBox(height: 10),
        normalBlackText(
            'Duis bibendum diam non erat facilaisis tincidunt. Fusce leo neque, Fusce leo neque, lacinia at tempor vitage, potta at arcu. Vestibulum varius non dui at pulvinar. Ut egestas orci in quam sollicitudin aliquet.')
      ]));
}
