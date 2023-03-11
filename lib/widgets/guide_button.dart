import 'package:flutter/material.dart';

class GuideButton extends StatefulWidget {
  final String section;
  final String name;
  final IconData icon;
  const GuideButton({
    super.key,
    required this.section,
    required this.icon,
    required this.name,
  });

  @override
  State<GuideButton> createState() => _GuideButtonState();
}

class _GuideButtonState extends State<GuideButton> {
  bool isHovered = false;

  void setHover(bool state) {
    setState(() {
      isHovered = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (_) => setHover(true),
      onExit: (_) => setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: transform,
        child: Column(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(widget.section),
              icon: Icon(
                widget.icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            if (isHovered) Center(child: Text(widget.name)) else const Text(''),
          ],
        ),
      ),
    );
  }
}
