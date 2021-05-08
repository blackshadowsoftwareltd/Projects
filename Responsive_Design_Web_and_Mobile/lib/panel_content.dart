import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // width: 200,
        decoration: BoxDecoration(
            color: Colors.yellow[100], borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Colors.red[100],
              height: 100,
              width: 100,
              margin: EdgeInsets.only(top: 40, bottom: 10),
            ),
            demoContent(),
          ],
        )),
      ),
    );
  }
}

class MainPanels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.deepOrange[100],
                borderRadius: BorderRadius.circular(10)),
            child: Text('Dashboard',
                style: TextStyle(color: Colors.black, fontSize: 25)),
          ),
          demoContent(widht: 350)
        ],
      ),
    );
  }
}

class RightPanels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            'Right Panel',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          demoContent(
            widht: 200,
          ),
        ],
      ),
    );
  }
}

class demoContent extends StatelessWidget {
  final double widht;

  const demoContent({Key key, this.widht}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = widht ?? 150;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width),
      contentList(_width)
    ]);
  }

  Widget contentList(double _width) => Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      // width: _width,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(50)));
}
