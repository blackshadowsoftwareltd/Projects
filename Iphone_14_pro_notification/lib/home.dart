import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final size = MediaQuery.of(context).size;
    // return Scaffold();
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        width: size.width,
        height: size.height,
      ),
    );
  }
}
