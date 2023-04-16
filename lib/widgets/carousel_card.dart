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
        children: <Widget>[
          /* Image.network(
            'https://img.freepik.com/fotos-gratis/a-paisagem-bonita-do-sol-da-praia-com-um-barco_1112-212.jpg?w=2000',
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ), */
          Container(
            color: Colors.orange,
            height: 160,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Work",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(height: 10),
                const Text(
                  'Work description',
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
                      "EXPLORE",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    onPressed: () => html.window.open(
                      'https://binarypiano.com/',
                      'pianada pai',
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
