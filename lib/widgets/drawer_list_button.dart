import 'package:flutter/material.dart';

class DrawerListButton extends StatefulWidget {
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
  State<DrawerListButton> createState() => _DrawerListButtonState();
}

class _DrawerListButtonState extends State<DrawerListButton> {
  bool isHovered = false;

  void setHover(bool state) {
    setState(() {
      isHovered = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setHover(true),
      onExit: (_) => setHover(false),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color:
              isHovered ? Theme.of(context).colorScheme.primary : Colors.grey,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          Scrollable.ensureVisible(
            widget.scrollKey.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
