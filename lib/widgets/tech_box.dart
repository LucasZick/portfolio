import 'package:flutter/material.dart';

class TechBox extends StatelessWidget {
  final String techName;
  const TechBox({super.key, required this.techName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        width: 20,
        height: 20,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/tech_logos/$techName.png',
                filterQuality: FilterQuality.high,
                width: 70,
                height: 70,
              ),
              Text(
                techName.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
