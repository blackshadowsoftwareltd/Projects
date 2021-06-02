import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final String url;

  const Preview({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(url, fit: BoxFit.cover)),
    );
  }
}
