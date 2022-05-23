import 'package:flutter/material.dart';

import 'droped_file_model.dart';

class DroppedFileWidgets extends StatelessWidget {
  final DroppedFile? file;

  const DroppedFileWidgets({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(file?.name);
    return file != null
        ? Container(
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [buildImage(file), buildInfo()]))
        : Container(
            alignment: Alignment.center,
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(20)),
            child: Text('No File',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)));
  }

  ///
  Widget buildImage(file) => ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(15)),
          child: Image.network(file!.url, fit: BoxFit.cover)));

  ///
  Widget buildInfo() => Container(
      width: 200,
      margin: EdgeInsets.only(left: 20),
      child: Column(children: [
        normalText(file!.name),
        normalText(file!.mime),
        normalText(file!.size)
      ]));

  ///
  normalText(label) => Text(label,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(color: Colors.white, fontSize: 18));
}
