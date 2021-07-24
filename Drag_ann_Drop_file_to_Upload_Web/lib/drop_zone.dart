import 'package:drag_drop_file_upload/droped_file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropZone extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropZone({Key? key, required this.onDroppedFile}) : super(key: key);
  @override
  _DropZoneState createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  /// This class must be Stateful Widget. otherwise occur controller initialization error
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isHighlighted
                          ? Colors.green[300]
                          : Colors.green[400]),
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  child: Stack(children: [
                    DropzoneView(
                      onCreated: (controller) => this.controller = controller,
                      onDrop: reciiveFile,
                      onHover: () => setState(() => isHighlighted = true),
                      onLeave: () => setState(() => isHighlighted = false),
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_rounded,
                                  color: Colors.white, size: 80),
                              Text('Drop files here',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ]))
                  ])),

              ///
              Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        final events = await controller.pickFiles();
                        if (events.isEmpty) return;
                        reciiveFile(events.first);
                      },
                      icon: Icon(Icons.search),
                      label: Text('Choose Files'),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          primary: Colors.green[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))))
            ]));
  }

  Future reciiveFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    // print('name: $name\nmime: $mime\nbytes: $bytes\nurl: $url');
    final droppedFile =
        DroppedFile(name: name, mime: mime, bytes: bytes, url: url);
    widget.onDroppedFile(droppedFile);
    setState(() {
      isHighlighted = false;
    });
  }
}
