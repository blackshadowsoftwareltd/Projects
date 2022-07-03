import 'package:flutter/widgets.dart'
    show BuildContext, FadeTransition, Navigator, PageRouteBuilder, Widget;

Future<T?> fadePush<T>(
  BuildContext context,
  Widget page, {
  Duration duration = const Duration(milliseconds: 150),
}) =>
    Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        transitionDuration: duration,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
