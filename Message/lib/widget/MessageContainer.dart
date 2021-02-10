import 'package:flutter/material.dart';

class MessagesContainers extends StatefulWidget {
  final text, time, sender, FuserId;

  MessagesContainers({this.sender, this.text, this.FuserId, this.time});

  @override
  _MessagesContainersState createState() => _MessagesContainersState();
}

class _MessagesContainersState extends State<MessagesContainers> {
  bool isSender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.sender != widget.FuserId)
      isSender = true;
    else
      isSender = false;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 5;
    return Container(
        padding:
            EdgeInsets.only(left: isSender ? 50 : 0, right: isSender ? 0 : 50),
        // margin: EdgeInsets.symmetric(vertical: 5),
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5,right: 20,bottom: 2),
                  child: Text(widget.time,
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]))),
              Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  constraints: BoxConstraints(minWidth: 30),
                  decoration: BoxDecoration(
                      color: isSender ? Colors.grey[200] : Colors.green[300],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: isSender
                              ? Radius.circular(20)
                              : Radius.circular(0),
                          bottomRight: isSender
                              ? Radius.circular(0)
                              : Radius.circular(20))),
                  child: Text(widget.text,
                      style: TextStyle(
                          fontSize: 18,
                          color: isSender ? Colors.black : Colors.white)))
            ]));
  }
}
