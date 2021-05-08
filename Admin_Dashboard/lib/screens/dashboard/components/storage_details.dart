import 'package:admin_dashboard/screens/dashboard/components/charts.dart';
import 'package:admin_dashboard/screens/dashboard/components/storage_info_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class StorageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Storage Details',
              style: TextStyle(fontSize: 15, color: Colors.white)),
          Charts(),
          StorageInfoCard(
              title: 'Documents Files',
              svgSrc: 'assets/icons/Documents.svg',
              numOfFiles: 1254,
              amountOfFiles: '1.32 GB'),
          StorageInfoCard(
              title: 'Media Files',
              svgSrc: 'assets/icons/media.svg',
              numOfFiles: 640,
              amountOfFiles: '2.45 GB'),
          StorageInfoCard(
              title: 'Other Files',
              svgSrc: 'assets/icons/folder.svg',
              numOfFiles: 124,
              amountOfFiles: '0.72 GB'),
          StorageInfoCard(
              title: 'Unkhown Files',
              svgSrc: 'assets/icons/unknown.svg',
              numOfFiles: 146,
              amountOfFiles: '0.20 GB'),
        ],
      ),
    );
  }
}
