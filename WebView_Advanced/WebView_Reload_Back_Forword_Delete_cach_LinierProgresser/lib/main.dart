import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: WebTestz()));

class WebTestz extends StatefulWidget {
  @override
  State<WebTestz> createState() => _WebTestzState();
}

class _WebTestzState extends State<WebTestz> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    print(progress);
    return WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();

            return false;
          }

          return true;
        },
        child: Scaffold(
            appBar: AppBar(title: const Text('WebViiew'), actions: [
              /// clear cach
              IconButton(
                  onPressed: () {
                    controller.clearCache();
                    CookieManager().clearCookies();
                  },
                  icon: const Icon(Icons.clear_all_rounded, size: 30)),

              /// reload
              IconButton(
                  onPressed: () => controller.reload(),
                  icon: const Icon(Icons.replay_circle_filled_sharp, size: 30)),

              /// go back
              IconButton(
                  onPressed: () async {
                    if (await controller.canGoBack()) {
                      controller.goBack();
                    }
                  },
                  icon: const Icon(Icons.settings_backup_restore_rounded,
                      size: 30)),

              /// go forword
              IconButton(
                  onPressed: () async {
                    if (await controller.canGoForward()) {
                      controller.goForward();
                    }
                  },
                  icon: const Icon(Icons.forward_5_rounded, size: 30)),
            ]),
            body: Column(children: [
              LinearProgressIndicator(
                  minHeight: 5,
                  value: progress,
                  color: Colors.lightGreen,
                  backgroundColor: Colors.white),
              Flexible(
                  child: WebView(
                      onProgress: (progress) =>
                          setState(() => this.progress = progress / 100),

                      ///
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: 'https://amazon.com',
                      onWebViewCreated: (controller) {
                        this.controller = controller;
                      }))
            ])));
  }
}
