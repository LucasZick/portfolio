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
    setState(() => isHovered = state);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = isHovered ? primaryColor : Colors.black87;

    return MouseRegion(
      onEnter: (_) => setHover(true),
      onExit: (_) => setHover(false),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          Scrollable.ensureVisible(
            widget.scrollKey.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          decoration: BoxDecoration(
            color: isHovered ? primaryColor.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovered ? primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isHovered ? 30 : 24,  // Efeito de "expansão"
                height: isHovered ? 30 : 24,
                alignment: Alignment.center,
                child: Icon(
                  widget.icon,
                  color: textColor,
                  size: isHovered ? 28 : 24, // Animação de ícone
                ),
              ),
              const SizedBox(width: 10),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: textColor,
                  fontWeight: isHovered ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 16,
                  letterSpacing: isHovered ? 1.2 : 1.0,
                  decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                ),
                child: Text(widget.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
