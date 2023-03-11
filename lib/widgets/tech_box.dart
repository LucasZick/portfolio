import 'package:flutter/material.dart';

class TechBox extends StatefulWidget {
  final String techName;
  const TechBox({super.key, required this.techName});

  @override
  State<TechBox> createState() => _TechBoxState();
}

class _TechBoxState extends State<TechBox> {
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
        transform: transform,
        curve: Curves.ease,
        child: Card(
          elevation: isHovered ? 20 : 10,
          shadowColor:
              isHovered ? Theme.of(context).colorScheme.primary : Colors.black,
          child: Container(
            width: 20,
            height: 20,
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/tech_logos/${widget.techName}.png',
                    filterQuality: FilterQuality.high,
                    width: 70,
                    height: 70,
                  ),
                  Text(
                    widget.techName.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
