import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutMeCard extends StatelessWidget {
  const AboutMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scrollbar(
          child: ListView(
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
              Text("about_me".tr(), style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
