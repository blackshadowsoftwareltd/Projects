import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<ServiceProviders>(
          create: (_) => ServiceProviders())
    ], child: MaterialApp(home: Home())));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// initializeation
    Provider.of<ServiceProviders>(context, listen: false).setDistrictData();

    ///
    return HomePage();
  }
}
