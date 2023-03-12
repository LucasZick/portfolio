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
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(widget.section),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                size: isHovered ? 25 : 20,
              ),
              Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
