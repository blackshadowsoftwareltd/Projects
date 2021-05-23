import 'package:flutter/material.dart';
import 'package:profile_web/Components/FooterPanel.dart';
import 'package:profile_web/Components/HeaderPanel.dart';
import 'package:profile_web/Components/ProfilePanle.dart';
import 'package:profile_web/Components/TopBackground.dart';
import 'package:profile_web/PlatformService.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdde9e9),
        body: PlatFormServices.isMobile(context)
            ? Stack(children: [
                TopBackground(),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderPanel(),
                          ProfilePanle(),
                          FooterPanel()
                        ]))
              ])
            : SafeArea(
                child: Stack(children: [
                TopBackground(),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderPanel(),
                          ProfilePanle(),
                          FooterPanel()
                        ]))
              ])));
  }
}
