import 'package:Pizza/screen/AdminLogin.dart';
import 'package:Pizza/screen/Login.dart';
import 'package:Pizza/services/Maps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Headers extends ChangeNotifier {
  String _address = 'Searching Address...';

  Widget appBar(BuildContext context, String address) {
    return Container(
        height: 80,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              blurRadius: 2,
              spreadRadius: 1)
        ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: Icon(Icons.admin_panel_settings,
                  size: 28, color: Colors.deepPurple),
              onPressed: () {
                FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                _firebaseAuth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminLoginPage()));
              }),
          Row(children: [
            IconButton(
              icon: Icon(FontAwesomeIcons.locationArrow,
                  color: Colors.deepPurple),
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 180,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(address,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        fontWeight: FontWeight.bold)))
          ]),
          IconButton(
              icon: Icon(Icons.logout, color: Colors.deepPurple),
              onPressed: () {
                FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                _firebaseAuth.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
        ]));
  }

  Widget headerText(var _width) {
    return Container(
        constraints: BoxConstraints(maxWidth: _width - 50),
        child: RichText(
            text: TextSpan(
                text: 'What would you like\n',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w300),
                children: [
              TextSpan(
                  text: 'to eat?',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple))
            ])));
  }

  Widget headerMenu(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.deepOrange, blurRadius: 15.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.grey.shade100),
                  child: Text('All Food',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                          fontSize: 18)))),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.blue, blurRadius: 15.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.grey.shade100),
                  child: Text(
                    'Pizza',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ))),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.green, blurRadius: 15.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.grey.shade100),
                  child: Text(
                    'Pasta',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )))
        ]));
  }

//
// @override
// Future<bool> openAppSittings() async =>
//     methodChannel.invokeMethod('openAppSittings');

// @override
// Future<bool> openLocationSittings() async =>
//     methodChannel.invokeMethod('openLocation Sittings');
//
// void _handlerPlatformException(PlatformException exception) {
//   switch (exception.code) {
//     case 'LOCATION_SERVICES_DISABLED':
//       throw LocationServiceDisabledException();
//     case 'LOCATION_SUBSCRIPTION_ACTIVE':
//       throw AlreadySubscribedException();
//     case 'PERMISSION_DEFINITIONS_NT_FOUND':
//       throw PermissionDefinitionsNotFoundException(exception.message);
//     case 'PERMISSION_DENIED':
//       throw PermissionDeniedException(exception.message);
//     case 'PERMISSION_REQUEST_PROGRESS':
//       throw PermissionRequestInProgressException(exception.message);
//     case ' LOCATION_UPDATE_FUTURE':
//       throw PositionUpdateException(exception.message);
//     default:
//       throw exception;
//   }
// }
}
