import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination/passanger_model.dart';
import 'package:pagination/providers.dart';
import 'package:provider/provider.dart';

import 'airline_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController controller = ScrollController();
  double? h, w;

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
            /// if the passenger list has less than 6 data. the afterLoad method will call again. and the method gets data from API.
            if (passanger.tried == false && passanger.data.length < 6) {
              passanger.afterLoad(passanger.page);
            }
            return ListView.builder(
                controller: controller,
                itemCount: passanger.data.length,
                itemBuilder: (context, index) {
                  String? id, name, headQuaters, imgPath;

                  ///
                  final data = passanger.data[index];

                  /// retrieving the airline's data.
                  data.airline!
                      .map((Airline e) => {
                            id = e.id.toString(),
                            name = e.name,
                            headQuaters = e.headQuaters,
                            imgPath = e.logo
                          })
                      .toList();

                  return AirLineCard(
                      isTrue: index + 1 == passanger.data.length,
                      name: name!,
                      headQuaters: headQuaters!,
                      imgPath: imgPath!);
                });
          } else
            return Center(child: normalText('Loading...'));
        });
  }
    ///
  Widget normalText(label) => Text(
        label,
        overflow: TextOverflow.visible,
        maxLines: 4,
        style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
      );
}
