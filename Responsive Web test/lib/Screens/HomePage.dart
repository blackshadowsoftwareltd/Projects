import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_getx/Components/DrawerMenu.dart';
import 'package:news_getx/Components/FeaturePanel/Features.dart';
import 'package:news_getx/Components/Footer.dart';
import 'package:news_getx/Components/Gallery.dart';
import 'package:news_getx/Components/HeaderPanel.dart';
import 'package:news_getx/Components/ProductFeature.dart';
import 'package:news_getx/Components/SlidePanel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        /// for controlling Drag Gesture
        drawerEnableOpenDragGesture: false,
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
                      Gallery(),
                      Footer()
                    ]))));
  }
}
