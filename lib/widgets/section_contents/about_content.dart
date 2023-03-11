import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/carousel_slider.dart';
import 'package:lucaszick/widgets/card_hole.dart';
import 'package:lucaszick/widgets/section_contents/about_cards.dart/about_me_card.dart';
import 'package:lucaszick/widgets/section_contents/about_cards.dart/studies_card.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: const [
            CardHole(side: Side.left),
            CardHole(side: Side.right),
            Carousel(
              widgetList: [StudiesCard(), AboutMeCard()],
            ),
            HoleShadow(side: Side.left),
            HoleShadow(side: Side.right),
          ],
        ),
      ),
    );
  }
}
