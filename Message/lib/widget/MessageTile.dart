import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String txt;

  MessageTile({this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(txt),
    );
  }
}
