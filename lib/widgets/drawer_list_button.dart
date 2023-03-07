import 'package:flutter/material.dart';

class DrawerListButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final GlobalKey scrollKey;
  const DrawerListButton({
    super.key,
    required this.title,
    required this.icon,
    required this.scrollKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
        Scrollable.ensureVisible(
          scrollKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
