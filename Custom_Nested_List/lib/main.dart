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
        body: Consumer<ListProvider>(
          builder: (_, state, __) {
            return ListView.builder(
                itemCount: state.listOfData.length,
                itemBuilder: (context, index) {
                  final _listOfData = state.listOfData[index];
                  return MainTile(
                      data: _listOfData, selectedModel: state.selectedModel);
                });
          },
        ));
  }
}

class MainTile extends StatelessWidget {
  const MainTile({Key? key, required this.data, required this.selectedModel})
      : super(key: key);
  final Model data;
  final Model? selectedModel;

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
                      print('pressed');
                      state.selectedModel = data;
                    },
                    child: Text(data.index.toString())),
              ),
              Container(
                height: data == selectedModel ? 100 : 0,
                color: Colors.green,
              )
            ],
          ),
        );
      },
    );
  }
}
