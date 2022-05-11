import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listOfData = List<Model>.generate(
        100, (i) => Model(index: i, values: List.generate(100, (x) => x)));

    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: const Text('Nested List')),
        body: ListView.builder(
            itemCount: _listOfData.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.green.shade100,
                      child: Column(
                        children: [
                          SizedBox(
                            width: _width,
                            child: OutlinedButton(
                                onPressed: () {
                                  print('pressed');
                                },
                                child:
                                    Text(_listOfData[index].index.toString())),
                          ),
                          Container(
                            height: 100,
                            color: Colors.green,
                            child: ListView.builder(
                                itemCount: _listOfData[index].values.length,
                                itemBuilder: (context, i) {
                                  final _data = _listOfData[index].values[i];

                                  return Container(
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(3),
                                    child: Text(_data.toString()),
                                  );
                                }),
                          )
                        ],
                      )),
                )));
  }
}

class Model {
  final int index;
  final List<int> values;
  Model({required this.index, required this.values});
}
