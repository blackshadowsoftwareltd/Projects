import 'package:admin_dashboard/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String title, svgSrc, totalStorage;
  final int numOfFiles, percentage;
  final Color color;

  CloudStorageInfo(
      @required this.title,
      @required this.svgSrc,
      @required this.totalStorage,
      @required this.numOfFiles,
      @required this.percentage,
      @required this.color);
}

List demoMyFiles = [
  CloudStorageInfo('Documents', 'assets/icons/Documents.svg', '1.28 GB', 3245,
      34, primaryColor),
  CloudStorageInfo('Google Drive', 'assets/icons/google_drive.svg', '2.9 GB',
      1328, 23, Color(0xFFFFA113)),
  CloudStorageInfo('One Drive', 'assets/icons/one_drive.svg', '1.02 GB',
     1328, 10, Color(0xFFA4CDFF)),
  CloudStorageInfo('Documents', 'assets/icons/drop_box.svg','7.3 GB',
 5328, 78, Color(0xFF007EE5))
];
