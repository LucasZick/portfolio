import 'package:circle_flags/circle_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 900;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "myself".tr(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text("about_me".tr(),
                                  textAlign: isScreenWide
                                      ? TextAlign.right
                                      : TextAlign.center,
                                  style: const TextStyle(fontSize: 18)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "formal_studies".tr(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                            Column(
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
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    "HOBBIES".tr(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: const [
                                  ListTile(
                                    trailing:
                                        Icon(Icons.skateboarding_outlined),
                                    title: Text("Skateboarding"),
                                  ),
                                  ListTile(
                                    trailing:
                                        Icon(Icons.sports_basketball_outlined),
                                    title: Text("Basketball"),
                                  ),
                                  ListTile(
                                    trailing:
                                        Icon(Icons.directions_bike_outlined),
                                    title: Text("Spinning"),
                                  ),
                                  ListTile(
                                    trailing: Icon(Icons.headset_outlined),
                                    title: Text("Musical Production"),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
