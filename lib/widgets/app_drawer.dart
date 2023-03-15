import 'package:easy_localization/easy_localization.dart';
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
                  title: "about_option".tr(),
                  icon: Icons.info_outlined,
                  scrollKey: sectionKeys['about']!,
                ),
                DrawerListButton(
                  title: 'skills_option'.tr(),
                  icon: Icons.interests_outlined,
                  scrollKey: sectionKeys['skills']!,
                ),
                DrawerListButton(
                  title: 'work_option'.tr(),
                  icon: Icons.work_outline_outlined,
                  scrollKey: sectionKeys['work']!,
                ),
                DrawerListButton(
                  title: 'contact_option'.tr(),
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
