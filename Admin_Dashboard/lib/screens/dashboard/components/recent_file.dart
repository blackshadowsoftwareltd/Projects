import 'package:admin_dashboard/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';


class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Files',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columnSpacing: defaultPadding,horizontalMargin: 0,
                columns: [
                  DataColumn(
                      label: Text('File Name',
                          style: TextStyle(fontSize: 12, color: Colors.white))),
                  DataColumn(
                      label: Text('Data',
                          style: TextStyle(fontSize: 12, color: Colors.white))),
                  DataColumn(
                      label: Text('Size',
                          style: TextStyle(fontSize: 12, color: Colors.white))),
                ],
                rows: List.generate(demoRecentFiles.length,
                    (index) => recentFileDataRow(demoRecentFiles[index]))),
          )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile recentFile) {
  return DataRow(cells: [
    DataCell(Row(children: [
      SvgPicture.asset(
        recentFile.icon,
        height: 30,
        width: 30,
      ),
      SizedBox(width: 10),
      Text(
        recentFile.title,
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      )
    ])),
    DataCell(Text(recentFile.date)),
    DataCell(Text(recentFile.size))
  ]);
}
