import 'package:circle_flags/circle_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StudiesCard extends StatelessWidget {
  const StudiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}
