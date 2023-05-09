import 'dart:async' show Timer;
import 'dart:developer' show log;
import 'dart:isolate' show Isolate, ReceivePort, SendPort;
import 'dart:ui' show DartPluginRegistrant;
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

Future<void> persistenceThreadSharedPreferences() async {
  /// ?
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('action', 'Start');

  /// ?
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
  DartPluginRegistrant
      .ensureInitialized(); //? to fix error: "Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized."
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString('action');
  log(action.toString());

  ///? --------------------------------------------------
  debugPrint('Isolate running $m');
  SendPort sendPort = m[0] as SendPort;

  Timer.periodic(const Duration(seconds: 1), (timer) {
    sendPort.send(timer.tick);
    if (timer.tick == 10) timer.cancel();
  });
}
