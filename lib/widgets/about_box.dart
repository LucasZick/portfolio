import 'package:flutter/material.dart';

class AboutBox extends StatelessWidget {
  final String title;
  final Widget child;
  const AboutBox({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
