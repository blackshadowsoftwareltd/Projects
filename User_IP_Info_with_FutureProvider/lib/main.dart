import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consumer_provider.dart';
import 'consumer_screen.dart';
import 'future_provider/future_provider_screen.dart';


void main() => runApp(MaterialApp(
        home: MultiProvider(providers: [
      ChangeNotifierProvider<Services>(
          create: (_) => Services()),
    ], child: Home())));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  IPApi.getIp(context);

    //  print(context.read<DataProvider>().getIp);
    // IPDetailsApi.getIpDetails();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => FutureProviderScreen())),
                child: Text('Future Provider Screen')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ConsumerScreen())),
                child: Text('Consumer Screen'))
          ],
        ),
      ),
    );
  }
}
