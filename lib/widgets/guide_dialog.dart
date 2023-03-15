import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/guide_button.dart';

class GuideDialog extends StatelessWidget {
  const GuideDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("guide_dialog_title".tr()),
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GuideButton(
                section: 'about',
                name: 'about_option'.tr(),
                icon: Icons.info_outlined,
              ),
              GuideButton(
                section: 'skills',
                name: 'skills_option'.tr(),
                icon: Icons.interests_outlined,
              ),
              GuideButton(
                section: 'work',
                name: 'work_option'.tr(),
                icon: Icons.work_outline,
              ),
              GuideButton(
                section: 'contact',
                name: 'contact_option'.tr(),
                icon: Icons.message_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
