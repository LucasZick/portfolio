import 'package:auto_size_text/auto_size_text.dart';
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

  Color getTechColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'arduino':
        return Colors.tealAccent[400]!;
      case 'glpk':
        return Colors.brown;
      case 'latex':
        return Colors.teal[800]!;
      case 'matlab':
        return Colors.orangeAccent[700]!;
      case 'oracle':
        return Colors.red[800]!;
      case 'qgis':
        return Colors.lightGreen;
      case 'ros':
        return Colors.teal;
      case 'python':
        return Colors.blueAccent;
      case 'javascript':
        return Colors.amber;
      case 'dart':
        return Colors.lightBlue;
      case 'flutter':
        return Colors.blue;
      case 'html':
        return Colors.deepOrange;
      case 'css':
        return Colors.indigo;
      case 'docker':
        return Colors.cyan;
      case 'linux':
        return Colors.grey;
      case 'sql':
        return Colors.orange;
      case 'postgres':
        return Colors.purple;
      case 'mysql':
        return Colors.blueGrey;
      case 'kafka':
        return Colors.pinkAccent;
      case 'redis':
        return Colors.redAccent;
      case 'mongo':
        return Colors.green;
      case 'git':
        return Colors.red;
      case 'github':
        return Colors.grey;
      case 'bash':
        return Colors.grey;
      
      default:
        return Colors.grey;
    }
  }

  @override
Widget build(BuildContext context) {
  final techColor = getTechColor(widget.techName);
  final hoveredTransform = Matrix4.identity()..translate(0.0, -6.0);
  final transform = isHovered ? hoveredTransform : Matrix4.identity();

  final brightness = Theme.of(context).brightness;
  final isDarkMode = brightness == Brightness.dark;
  final textColor = isDarkMode ? Colors.white : Colors.black87;

  return MouseRegion(
    onEnter: (_) => setHover(true),
    onExit: (_) => setHover(false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      transform: transform,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isHovered ? techColor.withOpacity(0.8) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHovered ? techColor : Colors.transparent,
          width: isHovered ? 2.5 : 0.5,
        ),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: techColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: isHovered ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'assets/images/tech_logos/${widget.techName}.png',
              height: 45,
              width: 45,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          AutoSizeText(
            widget.techName.toUpperCase(),
            maxLines: 1,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

}
