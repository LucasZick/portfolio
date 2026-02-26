import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  bool isHovered = false;

  void setHover(bool state) {
    setState(() => isHovered = state);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            onEnter: (_) => setHover(true),
            onExit: (_) => setHover(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isHovered ? primaryColor.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(70),
                boxShadow: [
                  if (isHovered)
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: primaryColor,
                child: const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/images/lucas_zick.jpeg'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 20,
              fontWeight: isHovered ? FontWeight.w600 : FontWeight.w400,
              color: isHovered ? primaryColor : Colors.black,
            ),
            child: const Text('Lucas Alexandre Zick'),
          ),
          const SizedBox(height: 10),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: isHovered ? primaryColor : Colors.black.withOpacity(0.6),
            ),
            child: const SelectableText(
              '\nlucasalexandrezick@gmail.com\n\n+55 47 99925 1862\n+49 157 7797 0761',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
