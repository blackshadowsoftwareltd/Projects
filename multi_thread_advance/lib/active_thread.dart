import 'dart:isolate' show Isolate, ReceivePort, SendPort;
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:synchronized/synchronized.dart' show Lock;

final receivePort = ReceivePort();
SendPort? sendPort;
final lock = Lock();

enum ActivityType { summation, multiplication }

///? This method will check if the isolate is active or not
///? If not, it will activate the isolate
///? If yes, it will send the message to the isolate
Future<void> doSomething(dynamic messages) async {
  if (sendPort == null) {
    await activeThread();
    await Future.delayed(const Duration(milliseconds: 500));
  }
  sendPort!.send(messages);
}

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
  sendPort!.send(receivePort.sendPort);

  //TODO init isarDBAsync

  ///? Listen
  receivePort.listen((messages) async => // listen from here
      await lock.synchronized(() // syncronized from here
          async {
        debugPrint('Isolate Thread $messages');
        if (messages[0] is ActivityType &&
            messages[0] == ActivityType.summation) {
          printSumOfValue(messages[1]);
        } else if (messages[0] is ActivityType &&
            messages[0] == ActivityType.multiplication) {
          printMulOfValue(messages[1]);
        }
      }));
}

Future<void> printSumOfValue(int x) async {
  debugPrint(_sum(x).toString());
}

int _sum(int x) {
  int i = 1, sum = 0;
  for (i; i < x; i++) {
    sum += i;
  }
  return sum;
}

Future<void> printMulOfValue(int x) async {
  debugPrint(_mul(x).toString());
}

int _mul(int x) {
  int i = 1, mul = 1;
  for (i; i < x; i++) {
    mul = mul * i;
  }
  return mul;
}
