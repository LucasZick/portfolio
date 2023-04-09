import 'package:flutter/material.dart';

class StripeDivider extends StatelessWidget {
  const StripeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        child: Divider(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
