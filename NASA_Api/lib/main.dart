import 'package:flutter/material.dart';
import 'package:nas/Screens/theEarth.dart';
import 'Screens/TechTransferPage.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NASA Api')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              nextPageButton(
                  'The Earth Info',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TheEarth()))),
              nextPageButton(
                  'TechTransfer Info',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TechTransferPage()))),
            ],
          ),
        ));
  }

  Widget nextPageButton(String title, Function function) =>
      OutlinedButton(onPressed: function, child: Text(title));
}
