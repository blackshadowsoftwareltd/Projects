import 'package:flutter/material.dart';

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
        children: [
          ElevatedButton(
              onPressed: () async => await doSomethingInThread(),
              child: const Text('Thread')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async => await persistenceThread(),
              child: const Text('Persistence Thread')),
        ],
      )),
    );
  }
}
