import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('assets/images/lucas_zick.jpeg'),
            ),
          ),
          const Text(
            'Lucas Alexandre Zick',
            style: TextStyle(fontSize: 20),
          ),
          const SelectableText(
            '\nlucasalexandrezick@gmail.com\n\n+55 47 99925 1862\n+49 157 7797 0761',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
