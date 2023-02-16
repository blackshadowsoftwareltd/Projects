import 'dart:math';

import 'package:flutter/material.dart';

import 'active_thread.dart' show activeThread, sendPort;
import 'persistence_thread.dart' show persistenceThread;
import 'thread.dart' show doSomethingInThread;

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi Thread')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async => await doSomethingInThread(),
              child: const Text('Thread')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async => await persistenceThread(),
              child: const Text('Persistence Thread')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async => await activeThread(),
              child: const Text('Activeted Thread')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => sendPort.send([
                    1,
                    Random().nextInt(4294967296)
                  ]), // calculate sum of 4294967296
              //onPressed: () => sendPort.send(['1', 1000001]), // print value
              child: const Text('Do something in Activeted Thread')),
        ],
      )),
    );
  }
}
