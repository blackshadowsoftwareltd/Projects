import 'package:Pizza/screen/CartPage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Footers extends ChangeNotifier {
  Widget floatinActionButton(BuildContext context) {
    return FloatingActionButton(
        heroTag: 'homeToDetails',
        child: Icon(
          EvaIcons.shoppingBag,
          size: 30,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage())));
  }
}
