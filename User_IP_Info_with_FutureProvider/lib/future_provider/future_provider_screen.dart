import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ip_details_api.dart';
import 'ip_details_model.dart';

class FutureProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Future Provider Screen')),
        body: Center(
            child: FutureProvider<IpDetailsModel>(
          create: (context) => IPDetailsApi.getIpDetails(),
          initialData: IpDetailsModel(),
          child: IpInfo(),
        )));
  }
}

///
class IpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<IpDetailsModel>(context);
    return Text(
        dataProvider.city != null ? dataProvider.city.toString() : '...');
  }
}
