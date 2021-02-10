import 'package:Pizza/Provider/Authentication.dart';
import 'package:Pizza/Provider/Calculations.dart';
import 'package:Pizza/Provider/PaymentProvid.dart';
import 'package:Pizza/helperWidget/Footer.dart';
import 'package:Pizza/helperWidget/Middles.dart';
import 'package:Pizza/screen/AdminPage.dart';
import 'package:Pizza/screen/SplashScreen.dart';
import 'package:Pizza/services/ManageData.dart';
import 'package:Pizza/services/Maps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helperWidget/Headers.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelpers()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footers()),
        ChangeNotifierProvider.value(value: GenerateMaps()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Calculations()),
        ChangeNotifierProvider.value(value: PaymentHelper()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: AdminPage(),
      ),
    );
  }
}
