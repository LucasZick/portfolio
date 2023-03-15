import 'package:animated_text_kit/animated_text_kit.dart';
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/tech_logos/${widget.techName}.png',
                    filterQuality: FilterQuality.high,
                    width: 50,
                    height: 50,
                  ),
                  if (isHovered)
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          WavyAnimatedText(widget.techName.toUpperCase()),
                        ],
                      ),
                    )
                  else
                    AutoSizeText(
                      widget.techName.toUpperCase(),
                      style: const TextStyle(fontSize: 15),
                      maxLines: 1,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
