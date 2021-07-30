import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination/providers.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController controller = ScrollController();

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final passenger = Provider.of<PassengerProvider>(context, listen: false);
    passenger.load();

    ///
    controller.addListener(() {
      double max = controller.position.maxScrollExtent;
      double currnet = controller.position.pixels;
      print('max $max current $currnet');

      if (max == currnet) {
        if (passenger.page <= passenger.totalPage!) {
          passenger.reload(passenger.page);
        }
      }
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    final passanger = Provider.of<PassengerProvider>(context);

    return FutureBuilder(
        future: passanger.isLoad,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (passanger.tried == false && passanger.data.length <6) {
              passanger.afterLoad(passanger.page);
            }
            return ListView.builder(
                controller: controller,
                itemCount: passanger.data.length,
                itemBuilder: (context, index) {
                  print(passanger.data.length);

                  ///
                  final data = passanger.data[index];
               data.airline.toString();
                  return Contentz(
                      index + 1,
                      passanger.data.length,
                      data.id.toString(),
                      // data.airline,
                      data.name.toString(),
                      data.trips.toString());
                });
          } else
            return Center(child: Text('Loading...'));
        });
  }

  ///
  Widget Contentz(
          int index, int length, String id,
          // String airline,
           String name, String trips) =>
      Column(
        children: [
          Container(
              width: double.infinity,
              color: Colors.green[300],
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('$index length'),
                  Text(id.toString()),
                  // Text(airline.toString()),
                  Text(name.toString()),
                  Text(trips.toString()),
                ],
              )),
          if (index == length)
            Container(
                height: 40,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Text('Loading...'))
        ],
      );
}
