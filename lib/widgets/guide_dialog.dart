import 'package:flutter/material.dart';

class GuideDialog extends StatelessWidget {
  const GuideDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Where do you want to go?"),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop('about'),
              icon: Icon(
                Icons.info_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop('skills'),
              icon: Icon(
                Icons.interests_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop('work'),
              icon: Icon(
                Icons.work_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop('contact'),
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
