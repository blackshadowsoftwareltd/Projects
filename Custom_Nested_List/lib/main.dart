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
    return Scaffold(
        appBar: AppBar(title: const Text('Nested List')),
        body: LayoutBuilder(builder: (context, constraint) {
          return Consumer<ListProvider>(builder: (_, state, __) {
            return ListView.builder(
                itemCount: state.listOfData.length,
                itemBuilder: (context, index) {
                  final _listOfData = state.listOfData[index];
                  return Tile(
                      constraint: constraint,
                      data: _listOfData,
                      selectedModel: state.selectedModel);
                });
          });
        }));
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.data,
      required this.selectedModel,
      required this.constraint})
      : super(key: key);
  final Model data;
  final Model? selectedModel;
  final BoxConstraints constraint;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Consumer<ListProvider>(
      builder: (_, state, __) {
        return Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.green.shade100,
          child: Column(
            children: [
              SizedBox(
                  width: _width,
                  child: OutlinedButton(
                      onPressed: () {
                        state.selectedModel = data;
                      },
                      child: Text(data.index.toString()))),
              Container(
                height: data == selectedModel ? constraint.maxHeight : 0,
                color: Colors.green,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.values.length,
                    itemBuilder: (context, i) {
                      final _subData = data.values[i];
                      return SubTile(data: _subData);
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}

class SubTile extends StatelessWidget {
  const SubTile({Key? key, required this.data}) : super(key: key);
  final int data;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        color: Colors.white,
        child: Text(data.toString()));
  }
}
