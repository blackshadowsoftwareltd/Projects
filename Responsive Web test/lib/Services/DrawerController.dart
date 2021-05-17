import 'package:flutter/material.dart';

class DrawerController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controllDrawer() {
    if (!_scaffoldKey.currentState.isDrawerOpen)
      return _scaffoldKey.currentState.openDrawer();
  }
}
