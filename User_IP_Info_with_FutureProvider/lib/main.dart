import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ip/ip_details_api.dart';
import 'package:user_ip/ip_details_model.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  IPApi.getIp(context);

    //  print(context.read<DataProvider>().getIp);
    // IPDetailsApi.getIpDetails();

    return Scaffold(appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FutureProvider<IpDetailsModel>(
              create: (context) => IPDetailsApi.getIpDetails(),
              initialData: IpDetailsModel(),
              child: IpInfo(),
            )
          ],
        ),
      ),
    );
  }
}

class IpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<IpDetailsModel>(context);
    return Text(dataProvider.city!=null?dataProvider.city.toString():'...');
  }
}
