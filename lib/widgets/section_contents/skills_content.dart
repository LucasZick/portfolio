import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/tech_box.dart';

class SkillsContent extends StatelessWidget {
  const SkillsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: GridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: const [
            TechBox(techName: 'python'),
            TechBox(techName: 'javascript'),
            TechBox(techName: 'dart'),
            TechBox(techName: 'flutter'),
            TechBox(techName: 'html'),
            TechBox(techName: 'css'),
            TechBox(techName: 'sql'),
            TechBox(techName: 'postgres'),
            TechBox(techName: 'mysql'),
            TechBox(techName: 'kafka'),
            TechBox(techName: 'redis'),
            TechBox(techName: 'mongo'),
            TechBox(techName: 'git'),
            TechBox(techName: 'github'),
            TechBox(techName: 'docker'),
            TechBox(techName: 'bash'),
            TechBox(techName: 'linux'),
          ],
        ),
      ),
    );
  }
}
