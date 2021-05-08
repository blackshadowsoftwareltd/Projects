import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/dashboard/components/my_file.dart';
import 'package:admin_dashboard/screens/dashboard/components/recent_file.dart';
import 'package:admin_dashboard/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(children: [
              Headers(),
              SizedBox(height: defaultPadding),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) StorageDetails()
                      ],
                    )),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),

                /// if the screen is less than 850 (mobile) not show this Content
                if (!Responsive.isMobile(context))
                  Expanded(
                      flex: 2,
                      child: SingleChildScrollView(child: StorageDetails()))
              ])
            ])));
  }
}
