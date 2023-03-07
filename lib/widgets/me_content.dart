import 'package:flutter/material.dart';

class MeContent extends StatelessWidget {
  const MeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 600,
      child: Text(
        "a passionate full-stack developer, crafting elegant, scalable solutions and pushing boundaries in the ever-evolving tech landscape.",
        style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
      ),
    );
  }
}
