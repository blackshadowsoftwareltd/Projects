import 'dart:isolate';
import 'package:flutter/foundation.dart' show debugPrint;

final receivePort = ReceivePort();
late SendPort sendPort;

Future<void> activeThread() async {
  debugPrint('Isolate activeting');

  ///? Isolate
  final isolate = await Isolate.spawn(runActiveThread, [receivePort.sendPort]);

  ///? Exit Listener
  isolate.addOnExitListener(receivePort.sendPort, response: 'Isolate exited');

  ///? Listen
  receivePort.listen((message) {
    debugPrint('Main Thread $message');
    if (message is SendPort) sendPort = message;
  });

  ///?
  debugPrint('Isolate started:');
}

Future<void> runActiveThread(dynamic m) async {
  debugPrint('Isolate running $m');

  ///? SendPort
  sendPort = m[0] as SendPort;

  ///? Send new SendPort from receivePort.sendPort by the sendPort
  sendPort.send(receivePort.sendPort);

  //TODO init isarDBAsync

  ///? Listen
  receivePort.listen((messages) {
    debugPrint('Isolate Thread $messages');
    if (messages[0] is int) {
      printSumOf1000001(messages[1]);
    } else if (messages[0] is String) {
      debugPrint(messages[1]);
    }
  });
}

Future<void> printSumOf1000001(int x) async {
  debugPrint(calculate(x).toString());
}

int calculate(int x) {
  int i = 1, sum = 0;
  for (i; i < x; i++) {
    sum += i;
  }
  return sum;
}
