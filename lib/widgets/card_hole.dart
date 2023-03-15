import 'package:flutter/material.dart';

enum Side { left, right }

class CardHole extends StatelessWidget {
  final Side side;
  const CardHole({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    late Alignment alignment;
    late Alignment begin;
    late Alignment end;
    if (side == Side.left) {
      alignment = Alignment.centerLeft;
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    }
    if (side == Side.right) {
      alignment = Alignment.centerRight;
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    }

    return Align(
      alignment: alignment,
      child: Container(
        width: 20,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: const [Colors.black54, Colors.black26],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}

class HoleShadow extends StatelessWidget {
  final Side side;
  const HoleShadow({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    late Alignment alignment;
    late Alignment begin;
    late Alignment end;
    if (side == Side.left) {
      alignment = Alignment.centerLeft;
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    }
    if (side == Side.right) {
      alignment = Alignment.centerRight;
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    }

    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: const [Colors.black54, Colors.transparent],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        width: 15,
      ),
    );
  }
}
