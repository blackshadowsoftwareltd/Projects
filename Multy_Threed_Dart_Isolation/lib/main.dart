import 'dart:isolate';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<int> list;
  @override
  void initState() {
    super.initState();
    list = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: list.isNotEmpty
              ? Text(list.length.toString())
              : const CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        ///? with isolate
        makeIsolation();

        ///? without isolate
        // generateAList();
      }),
    );
  }

  void makeIsolation() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_connectToServer, [receivePort.sendPort, 'nothing']);
    receivePort.listen((message) {
      list = message;
      setState(() {});
    });
  }

  static void _connectToServer(List<dynamic> args) async {
    var sendPort = args.first as SendPort;
    List<int> list = [];
    for (int i = 0; i < 1000000; i++) {
      Future.delayed(Duration.zero);
      list.add(i);
    }
    sendPort.send(list);
  }

  generateAList() {
    list.clear();
    for (int i = 0; i < 1000000; i++) {
      Future.delayed(const Duration(milliseconds: 1), () {
        list.add(i);
      });
    }
    setState(() {});
  }
}
