import 'package:flutter/material.dart';
import 'package:pex/Services/Service.dart';
import 'package:provider/provider.dart';
import 'Screens/HomePage.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Service())],
        child: HomePage());
  }
}
