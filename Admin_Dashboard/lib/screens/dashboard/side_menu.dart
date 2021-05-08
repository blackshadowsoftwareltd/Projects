import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 class SideMenu extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Drawer(
                child: SingleChildScrollView(
                  child: Column(children: [
                    DrawerHeader(child: Image.asset('assets/images/logo.png')),
                    DrawerListTile(
                        title: 'Dashboard',
                        svgSrc: 'assets/icons/menu_dashbord.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Transection',
                        svgSrc: 'assets/icons/menu_tran.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Task',
                        svgSrc: 'assets/icons/menu_task.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Documents',
                        svgSrc: 'assets/icons/menu_doc.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Store',
                        svgSrc: 'assets/icons/menu_store.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Notification',
                        svgSrc: 'assets/icons/menu_notification.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Profile',
                        svgSrc: 'assets/icons/menu_profile.svg',
                        pressed: () {}),
                    DrawerListTile(
                        title: 'Settings',
                        svgSrc: 'assets/icons/menu_setting.svg',
                        pressed: () {}),
                  ]),
                ),
              );
   }
 }
 class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {@required this.title,
      @required this.svgSrc,
      @required this.pressed,
      Key key})
      : super(key: key);
  final String title, svgSrc;
  final VoidCallback pressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
      onTap: pressed,
      horizontalTitleGap: 0,
    );
  }
}