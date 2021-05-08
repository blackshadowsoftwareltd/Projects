import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  final String title, svgSrc, amountOfFiles;
  final int numOfFiles;

  const StorageInfoCard(
      {Key key,
      @required this.title,
      @required this.svgSrc,
      @required this.amountOfFiles,
      @required this.numOfFiles})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: primaryColor.withOpacity(.15)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 25, width: 25, child: SvgPicture.asset(svgSrc)),
          Spacer(flex: 1),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(fontSize: 15, color: Colors.white)),
            Text('$numOfFiles',
                style: TextStyle(fontSize: 12, color: Colors.white38)),
          ]),
          Spacer(flex: 5),
          Text('$amountOfFiles',
              style: TextStyle(fontSize: 14, color: Colors.white54)),
        ],
      ),
    );
  }
}
