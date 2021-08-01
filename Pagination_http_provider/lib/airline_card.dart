import 'package:flutter/material.dart';

class AirLineCard extends StatelessWidget {
  final bool isTrue;
  final String name, headQuaters, imgPath;

  AirLineCard(
      {Key? key,
      required this.isTrue,
      required this.name,
      required this.headQuaters,
      required this.imgPath})
      : super(key: key);
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
          width: double.infinity,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              img(imgPath),
              Container(
                  width: w! * .6,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalText('Name: $name'),
                        normalText('Head Quaters: $headQuaters')
                      ])),
            ],
          )),

      /// if original index +1 == length.
      if (isTrue)
        Container(
            height: 40,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: normalText('Loading...'))
    ]);
  }

  ///
  Widget img(String imgPath) => Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: w! * .3,
      height: 70,
      child: Image.network(imgPath, fit: BoxFit.contain));

  ///
  Widget normalText(label) => Text(
        label,
        overflow: TextOverflow.visible,
        maxLines: 4,
        style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
      );
}
