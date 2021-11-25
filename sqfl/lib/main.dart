import 'package:flutter/material.dart';
import 'package:sqfl/components/list.dart';

import 'database/dialog.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SQFlite To Do')),
        body: const DatabaseList(),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => InputDialog(),
              );
            },
            label: Row(children: const [Icon(Icons.add), Text('Add Todo')])));
  }
}
