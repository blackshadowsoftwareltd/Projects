import 'dart:async' show Timer;
import 'dart:isolate' show Isolate, ReceivePort, SendPort;
import 'package:flutter/foundation.dart' show debugPrint;

Future<void> persistenceThread() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(
    _doSomethingInIsolate,
    [receivePort.sendPort],
    onExit: receivePort.sendPort,
    onError: receivePort.sendPort,
  );

  isolate.addOnExitListener(receivePort.sendPort, response: 'Isolate exited');

  receivePort.listen((message) {
    debugPrint(message.toString());
  });

  debugPrint('Isolate started:');
}

Future<void> _doSomethingInIsolate(dynamic m) async {
  debugPrint('Isolate running $m');
  SendPort sendPort = m[0] as SendPort;

  Timer.periodic(const Duration(seconds: 1), (timer) {
    sendPort.send(timer.tick);
    if (timer.tick == 10) timer.cancel();
  });
}
