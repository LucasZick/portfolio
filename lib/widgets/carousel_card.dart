import 'package:flutter/material.dart';
import 'dart:html' as html;

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              'assets/images/placeholders/banner-placeholder.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Binary Piano",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(height: 10),
                const Text(
                  'Web based binary piano, just for fun (not mine)',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      "Take a look",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    onPressed: () => html.window.open(
                      'https://binarypiano.com/',
                      'binary piano',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
