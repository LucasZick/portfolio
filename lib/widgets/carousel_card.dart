import 'package:flutter/material.dart';
import 'dart:html' as html;

class CarouselCard extends StatelessWidget {
  const CarouselCard(
      {super.key,
      required this.title,
      required this.description,
      required this.url,
      this.imageName = "assets/images/placeholders/banner-placeholder.jpg"});
  final String title;
  final String description;
  final String url;
  final String imageName;

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
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(fontSize: 24),
                ),
                Container(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
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
                    onPressed: () {
                      html.window.open(url, title);
                    },
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
