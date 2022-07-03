import 'dart:async';
import 'dart:io';

WebSocket? dataSocket;
StreamSubscription? dataSubscription;
const maxDuration = Duration(seconds: 5000);
Duration retryDuration = const Duration(seconds: 5);

Future<void> connectWebSocketInBackground() async {
  dataSocket = null;
  final _url = baseUrl + '/'; //? -background for background connetion

  try {
    //? notification initalize
    WidgetsFlutterBinding.ensureInitialized();

    //? connect to web socket
    dataSocket ??= await WebSocket.connect(_url, headers: {});

    if (dataSocket == null) return _retryConnection();
    if (dataSocket!.readyState != WebSocket.open) return _retryConnection();

    await dataSubscription?.cancel();

    dataSubscription = dataSocket!.listen(
      listenWebSocketResponse,
      onDone: () => _retryConnection(),
      onError: (e) => print('Error: $e'),
      cancelOnError: false,
    );

    ///? this code for background to await, connected, listioning a long time
    // print('conneted to web socket in Background');
    // await Future.delayed(const Duration(seconds: 880));
    print('...... listening end');
  } catch (e) {
    print(e);
    return _retryConnection();
  }
}

Future<void> _retryConnection() async {
  ///? this code for retry after delay
  // if (retryDuration.inSeconds < maxDuration.inSeconds) {
  //   retryDuration = Duration(seconds: retryDuration.inSeconds * 2);
  // }

  print('[!]WebSocket disconnected');
  await dataSocket?.close();
  await Future.delayed(retryDuration);
  return await connectWebSocketInBackground();
}

void listenWebSocketResponse(data) {}
