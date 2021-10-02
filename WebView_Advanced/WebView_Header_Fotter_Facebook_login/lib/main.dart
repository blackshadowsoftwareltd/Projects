import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'facebook.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () => Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => WebTestz())),
                      child: const Text('WebTest')),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Facebookz())),
                      child: const Text('Facebook login'))
                ])));
  }
}

class WebTestz extends StatelessWidget {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://amazon.com',
              onWebViewCreated: (controller) {
                this.controller = controller;
              },

              /// whene start to load
              onPageStarted: (url) => print('New Website: $url')),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FloatingActionButton.extended(
              heroTag: 'z',
              label: const Text('YouTube'),
              onPressed: () async {
                /// navigating another websites
                final url = await controller.currentUrl();
                print('Previous Website: $url');
                controller.loadUrl('https://youtube.com');
              }),
          FloatingActionButton.extended(
              heroTag: 'Hide Header & Footer',
              label: const Text('Hide Header & Footer'),
              onPressed: () async {
                /// Inject Javascript
                /// removeing site titlebar
                controller.evaluateJavascript(
                    "document.getElementsByTagName('header')[0].style.display='none'");

                /// Inject Javascript
                /// removing site footer panel
                controller.evaluateJavascript(
                    "document.getElementsByTagName('footer')[0].style.display='none'");
              })
        ]));
  }
}
