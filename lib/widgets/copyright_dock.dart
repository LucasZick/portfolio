import 'package:flutter/material.dart';

class CopyrightDock extends StatelessWidget {
  const CopyrightDock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SelectableText(
          '© 2023 Lucas Alexandre Zick',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
