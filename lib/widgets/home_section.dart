import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final Widget child;
  final GlobalKey scrollKey;
  final String title;
  final double spacer;
  const HomeSection({
    super.key,
    required this.child,
    required this.scrollKey,
    required this.title,
    required this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      key: scrollKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            child,
            SizedBox(
              height: spacer,
            )
          ],
        ),
      ),
    );
  }
}
