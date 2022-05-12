// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

void main() => runApp(MaterialApp(
        home: MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ListProvider())],
      child: const Home(),
    )));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widget built');
    return Scaffold(
        appBar: AppBar(title: const Text('Nested List')),
        body: LayoutBuilder(builder: (context, constraint) {
          return Consumer<ListProvider>(builder: (_, state, __) {
            return ListView.builder(
                itemCount: state.listOfData.length,
                itemBuilder: (context, index) {
                  final _listOfData = state.listOfData[index];
                  return Tile(
                      index: index, constraint: constraint, data: _listOfData);
                });
          });
        }));
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.data,
      required this.constraint,
      required this.index})
      : super(key: key);
  final int? index;
  final Model? data;
  final BoxConstraints constraint;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Consumer<ListProvider>(builder: (_, state, __) {
      return InkWell(
          onTap: data!.data == null
              ? null
              : () {
                  state.addList(
                      index: index!, middleList: data!.data!, single: data!);
                },
          child: Container(
              decoration: BoxDecoration(color: Colors.green.shade100),
              margin:
                  EdgeInsets.fromLTRB(data!.data != null ? 10 : 30, 3, 3, 3),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: SizedBox(
                  width: _width,
                  child: Text(
                      data!.name! +
                          ' --+-- i $index',
                      style: const TextStyle(fontSize: 18)))));
    });
  }
}
