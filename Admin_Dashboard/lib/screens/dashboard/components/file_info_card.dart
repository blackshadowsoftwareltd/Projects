import 'package:admin_dashboard/models/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class FileInOfCard extends StatelessWidget {
  final CloudStorageInfo info;

  const FileInOfCard({Key key, @required this.info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(defaultPadding * .75),
                decoration: BoxDecoration(
                    color: info.color.withOpacity(.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(
                  info.svgSrc,
                  color: info.color,
                )),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white54),
              onPressed: () {},
            )
          ]),
          Text(info.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 14)),
          ProgressLine(color: info.color, percentage: info.percentage),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${info.numOfFiles} Files',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.5), fontSize: 12)),
              Text(info.totalStorage,
                  style: TextStyle(
                      color: info.color,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  final Color color;
  final int percentage;

  const ProgressLine(
      {Key key, this.color = primaryColor, @required this.percentage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
                color: color.withOpacity(.1),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        LayoutBuilder(
            builder: (context, constraints) => Container(
                  width: constraints.maxWidth * (percentage / 100),
                  height: 5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ))
      ],
    );
  }
}
