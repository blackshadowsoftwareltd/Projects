import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Facebookz extends StatelessWidget {
  ///
  late WebViewController controller;

  bool isSubmitted = false;

  ///
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://m.facebook.com/',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },

          /// reload after finished previous work
          onPageFinished: (url) {
            if (isSubmitted) {
              controller.loadUrl('https://m.facebook.com/');
              isSubmitted = false;
            }
          },
        )),
        floatingActionButton: FloatingActionButton.extended(
            label: const Text('load id & pass'),
            onPressed: () async {
              String email = 'example@facebook.com', password = '0123654789';

              /// Inject Javascript
              /// load email & password from variable
              controller.evaluateJavascript(
                  "document.getElementById('m_login_email').value='$email'");
              controller.evaluateJavascript(
                  "document.getElementById('m_login_password').value='$password'");
              await Future.delayed(const Duration(seconds: 1));
              isSubmitted = true;

              /// working as login button
              await controller.evaluateJavascript('document.forms[0].submit()');
            }));
  }
}
