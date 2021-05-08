import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selectable_data_list/responsive.dart';
import 'menu_controller.dart';
import 'responsive.dart';
import 'panel_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// mush need scaffold key. drawer is not open or close without scaffold key
        key: context.read<MenuController>().scaffoldKey,
        drawer: Drawers(),
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (Responsive.isDesktop(context)) Expanded(child: Drawers()),
          Expanded(
              flex: 3,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                        height: 90,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!Responsive.isDesktop(context))
                              IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                  ),
                                  onPressed: context
                                      .read<MenuController>()
                                      .controllMenu),
                            Text('Responsive Design',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30))
                          ],
                        )),
                    (!Responsive.isMobile(context))
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Expanded(flex: 2, child: MainPanels()),
                                Expanded(flex: 1, child: RightPanels())
                              ])
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [MainPanels(), RightPanels()])
                  ])))
        ])));
  }
}
