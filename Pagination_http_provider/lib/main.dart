import 'package:flutter/material.dart';
import 'package:pagination/body.dart'; 
import 'package:pagination/providers.dart';
import 'package:provider/provider.dart'; 

void main() => runApp(MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider<PassengerProvider>(
          create: (_) => PassengerProvider(),
        )
      ],
      child: Home(),
    )));

class Home extends StatelessWidget {
  ///

 

  @override
  Widget build(BuildContext context) {
    // PassangerApi.getPassanger();
    return Scaffold(
      appBar: AppBar(title: Text('Pagination with http & provider'),),
      body:  Body(),    
    );
  }
}
