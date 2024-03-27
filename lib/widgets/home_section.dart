import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final Widget child;
  final GlobalKey scrollKey;
  final String title;
  final bool last;
  const HomeSection({
    super.key,
    this.last = false,
    required this.child,
    required this.scrollKey,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width > 1000 ? 1000 : size.width,
      constraints: last ? null : BoxConstraints(minHeight: size.height * 1.2),
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
          ],
        ),
      ),
    );
  }
}
