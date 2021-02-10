import 'package:flutter/material.dart';

class ModelCard extends StatefulWidget {
  final String modelName;

  ModelCard({this.modelName});

  @override
  _ModelCardState createState() => _ModelCardState();
}

class _ModelCardState extends State<ModelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Text(widget.modelName),
    );
  }
}
