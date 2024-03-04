import 'package:flutter/material.dart';

class RandomColor {
  static List<MaterialColor> colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.amber,
    Colors.grey,
    Colors.blueGrey,
    Colors.cyan,
    Colors.indigo,
    Colors.teal,
  ];
  static MaterialColor getRandomColor() {
    return (colors..shuffle()).first;
  }
}
