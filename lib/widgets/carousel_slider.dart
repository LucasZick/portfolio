import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Widget> widgetList;
  const Carousel({super.key, required this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: CarouselSlider(
        items: widgetList,
        options: CarouselOptions(
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 20),
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
