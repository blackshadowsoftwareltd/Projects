import 'package:flutter/material.dart'; 

import 'ColorListModel.dart';
import 'ColorListService.dart';

class ColorListPage extends StatelessWidget {
  Future<ColorModel> colorModel = getColors();
  final buffer = StringBuffer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Color List Page'),),
        body: Container(
            child: FutureBuilder<ColorModel>(
                future: colorModel,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text(snapshot.error);
                  if (snapshot.hasData)
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10),
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) => contents(
                            snapshot.data.data[index].id,
                            snapshot.data.data[index].name,
                            snapshot.data.data[index].year,
                            snapshot.data.data[index].color,
                            snapshot.data.data[index].pantoneValue));
                  return Center(child: CircularProgressIndicator());
                })));
  }

  Widget contents(
      int id, String name, int year, String color, String pantoneValue) {
    return Container(
        color: Colors.grey[100],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          zText(id),
          zText(name),
          zText(year),
          zText(color),
          zText(pantoneValue)
        ]));
  }

  Widget zText(Object label) => Text('$label');
}
