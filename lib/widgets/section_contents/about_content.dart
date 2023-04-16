import 'package:circle_flags/circle_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/about_box.dart';
import 'package:lucaszick/widgets/animated_text_box.dart';
import 'package:lucaszick/widgets/stripe_divider.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 900;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Flex(
          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:
                  isScreenWide ? 400 : MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  AboutBox(
                    title: "myself".tr(),
                    child: Padding(
                      padding: EdgeInsets.only(right: isScreenWide ? 10 : 0),
                      child: isScreenWide
                          ? Text(
                              "about_me".tr(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 18),
                            )
                          : AnimatedTextWithButton(
                              text: "about_me".tr(),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            if (isScreenWide)
              Container(
                width: 1,
                height: 500,
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.symmetric(vertical: 50),
              ),
            SizedBox(
              width:
                  isScreenWide ? 400 : MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Visibility(
                    visible: !isScreenWide,
                    child: const StripeDivider(),
                  ),
                  AboutBox(
                    title: "formal_studies".tr(),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.school_outlined),
                          title: Text("web_development".tr()),
                          subtitle: Text("technical_course".tr()),
                          trailing: CircleFlag('br'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.school_outlined),
                          title: Text("information_systems".tr()),
                          subtitle: Text("graduation_degree".tr()),
                          trailing: CircleFlag('br'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.school_outlined),
                          title: Text("international_business".tr()),
                          subtitle: Text("graduation_degree".tr()),
                          trailing: CircleFlag('de'),
                        ),
                      ],
                    ),
                  ),
                  const StripeDivider(),
                  AboutBox(
                    title: "hobbies".tr(),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: const Icon(Icons.skateboarding_outlined),
                          title: Text("skating".tr()),
                        ),
                        ListTile(
                          trailing: const Icon(Icons.directions_bike_outlined),
                          title: Text("pedal".tr()),
                        ),
                        ListTile(
                          trailing:
                              const Icon(Icons.sports_basketball_outlined),
                          title: Text("basketball".tr()),
                        ),
                        ListTile(
                          trailing: const Icon(Icons.headset_outlined),
                          title: Text("musical_production".tr()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
