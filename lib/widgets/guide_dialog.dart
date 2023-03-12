import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/guide_button.dart';

class GuideDialog extends StatelessWidget {
  const GuideDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Where do you want to go?"),
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              GuideButton(
                section: 'about',
                name: 'About',
                icon: Icons.info_outlined,
              ),
              GuideButton(
                section: 'skills',
                name: 'Skills',
                icon: Icons.interests_outlined,
              ),
              GuideButton(
                section: 'work',
                name: 'Work',
                icon: Icons.work_outline,
              ),
              GuideButton(
                section: 'contact',
                name: 'Contact',
                icon: Icons.message_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
