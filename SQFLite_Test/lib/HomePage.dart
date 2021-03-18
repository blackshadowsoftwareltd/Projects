import 'package:SQFLite_Test/Helpers/DataBaseHelper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQFLite Test')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
                child: Text('INSERT'),
                onPressed: () async {
                  int i = await DataBaseHelper.instance
                      .insert({DataBaseHelper.dbColumnName: 'Remon Ahammad'});
                  print('\n id is : $i');
                }),
            FlatButton(
                child: Text('QUERY'),
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DataBaseHelper.instance.queryAll();
                  print(queryRows);
                }),
            FlatButton(
                child: Text('UPDATE'),
                onPressed: () async {
                  int updateId = await DataBaseHelper.instance.update({
                    DataBaseHelper.dbColumnId: 2,
                    DataBaseHelper.dbColumnName: 'Ahammad Remon'
                  });
                  print(updateId);
                }),
            FlatButton(
              child: Text('DELETE'),
              onPressed: () async {
                int rowsEffected = await DataBaseHelper.instance.delets(2);
                print(rowsEffected);
              },
            ),
          ],
        ),
      ),
    );
  }
}
