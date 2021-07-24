import 'droped_file_model.dart';
import 'package:flutter/material.dart';
import 'dropped_file.dart';
import 'drop_zone.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DroppedFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Drag and Drop File Upload')),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: Colors.green,
            margin: EdgeInsets.all(50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DroppedFileWidgets(file: file),
                  DropZone(onDroppedFile: (file) {
                    this.file = file;
                    setState(() {});
                  })
                ])));
  }
}
