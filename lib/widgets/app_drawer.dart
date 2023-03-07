import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/drawer_list_button.dart';
import 'package:lucaszick/widgets/header_drawer.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key, required this.sectionKeys});
  final Map<String, GlobalKey> sectionKeys;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeaderDrawer(),
            const Divider(),
            Column(
              children: [
                DrawerListButton(
                  title: 'About',
                  icon: Icons.info_outlined,
                  scrollKey: sectionKeys['about']!,
                ),
                DrawerListButton(
                  title: 'Skills',
                  icon: Icons.interests_outlined,
                  scrollKey: sectionKeys['skills']!,
                ),
                DrawerListButton(
                  title: 'Work',
                  icon: Icons.work_outline_outlined,
                  scrollKey: sectionKeys['work']!,
                ),
                DrawerListButton(
                  title: 'Contact',
                  icon: Icons.message_outlined,
                  scrollKey: sectionKeys['contact']!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
