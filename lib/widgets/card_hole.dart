import 'package:flutter/material.dart';

enum Side { left, right }

class GradientSideWidget extends StatelessWidget {
  final Side side;
  final double width;
  final List<Color> colors;
  final double borderRadius;

  const GradientSideWidget({
    super.key,
    required this.side,
    required this.width,
    required this.colors,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = side == Side.left ? Alignment.centerLeft : Alignment.centerRight;
    final begin = side == Side.left ? Alignment.centerLeft : Alignment.centerRight;
    final end = side == Side.left ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: colors,
          ),
          borderRadius: BorderRadius.horizontal(
            left: side == Side.left ? Radius.circular(borderRadius) : Radius.zero,
            right: side == Side.right ? Radius.circular(borderRadius) : Radius.zero,
          ),
        ),
      ),
    );
  }
}

class CardHole extends StatelessWidget {
  final Side side;
  const CardHole({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    return GradientSideWidget(
      side: side,
      width: 20,
      colors: const [Colors.black54, Colors.black26],
    );
  }
}

class HoleShadow extends StatelessWidget {
  final Side side;
  const HoleShadow({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    return GradientSideWidget(
      side: side,
      width: 15,
      colors: const [Colors.black54, Colors.transparent],
    );
  }
}
