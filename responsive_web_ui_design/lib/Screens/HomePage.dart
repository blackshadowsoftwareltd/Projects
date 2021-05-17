import 'package:flutter/material.dart';
import 'package:responsive_web_ui_design/Components/FeaturePanel/Features.dart';
import 'package:responsive_web_ui_design/Components/Gallery.dart';
import 'package:responsive_web_ui_design/Components/HeaderPanel.dart';
import 'package:responsive_web_ui_design/Components/ProductFeature.dart';

import 'package:responsive_web_ui_design/Components/SlidePanel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderPanel(),
            SlidePanel(),
            Features(),
            ProductFeature(),
            Gallery()
          ],
        ),
      ),
    ));
  }
}
