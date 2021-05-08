import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffondKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffondKey;

  void controllMenu() {
    if (!_scaffondKey.currentState.isDrawerOpen) {
      _scaffondKey.currentState.openDrawer();
    }
  }
}
