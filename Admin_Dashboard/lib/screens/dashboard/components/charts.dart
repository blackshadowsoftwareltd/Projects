import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        height: 200,
        child: Stack(children: [
          PieChart(PieChartData(

              /// 90 degree
              startDegreeOffset: -99,

              /// space each orther
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: pieChartSelectionData)),
          Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Text('28.5',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w100)),
                Text(
                  'Of 128 GB',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                )
              ]))
        ]));
  }
}

List<PieChartSectionData> pieChartSelectionData = [
  PieChartSectionData(
      color: Colors.blue, value: 25, showTitle: false, radius: 25),
  PieChartSectionData(
      color: Colors.green, value: 25, showTitle: false, radius: 23),
  PieChartSectionData(
      color: Colors.red, value: 10, showTitle: false, radius: 19),
  PieChartSectionData(
      color: Colors.yellow, value: 15, showTitle: false, radius: 16),
  PieChartSectionData(
      color: primaryColor.withOpacity(.1),
      value: 25,
      showTitle: false,
      radius: 13)
];
