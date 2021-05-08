import 'package:admin_dashboard/controllers/MenuController.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class Headers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Responsive.isMobile(context))
        ? Container(
            child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: context.read<MenuController>().controllMenu,
                    ),
                  Spacer(flex:1),
                  Text('Dashboard',
                      style: Theme.of(context).textTheme.headline6),
                  Spacer(flex: 8)
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SearchField()),
                  SizedBox(width: 10),
                  AdminProfile()
                ])
          ]))
        : Row(children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: context.read<MenuController>().controllMenu),
            Text('Dashboard', style: Theme.of(context).textTheme.headline6),
            Spacer(flex: 1),
            SizedBox(width: 10),
            Expanded(child: SearchField()),
            SizedBox(width: 10),
            AdminProfile()
          ]);
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            fillColor: secondaryColor,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(
                        horizontal: (Responsive.isMobile(context)) ? 15 : 12,
                        vertical: defaultPadding / 2),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      width: 16,
                    )))));
  }
}

class AdminProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 3),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white12),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[700],
              child: Icon(Icons.person, size: 35)),
          if (!Responsive.isMobile(context)) SizedBox(width: 5),
          if (!Responsive.isMobile(context))
            Text('Remon Ahammad',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 25,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
