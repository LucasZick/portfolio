import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/card_hole.dart';
import 'package:lucaszick/widgets/carousel_card.dart';
import 'package:lucaszick/widgets/carousel_slider.dart';

class WorkContent extends StatelessWidget {
  const WorkContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            CardHole(side: Side.left),
            CardHole(side: Side.right),
            Carousel(
              widgetList: [
                CarouselCard(
                  title: "AutoNav",
                  description:
                      "Development of a Multi-Robotic Teleoperation System with Intuitive Hand Recognition",
                  url: "https://www.youtube.com/watch?v=94S4nJ3IwUw",
                  imageName: "assets/images/work/auto_nav.png",
                ),
              ],
            ),
            HoleShadow(side: Side.left),
            HoleShadow(side: Side.right),
          ],
        ),
      ),
    );
  }
}
