import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile, tablet, desktop;

  const Responsive(
      {Key key,
      @required this.mobile,
      @required this.tablet,
      @required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    /// condition for detecting current device
    if (_size.width >= 1100)
      return desktop;
    else if (_size.width >= 890 && tablet != null)
      return tablet;
    else
      return mobile;
  }
/// method
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 890;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 890;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
